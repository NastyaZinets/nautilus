% Kalman Filter
%%
%
%
%

clc
clear all
close all

for i=1:1:20000
    I(i)=i;
end

M = csvread('r-gelio.csv');
T = csvread('t-gelio.csv');

E = eye(6);
R = [1 0 0 0 0 0;
     0 1 0 0 0 0;
     0 0 1 0 0 0;
     0 0 0 1e-10 0 0;
     0 0 0 0 1e-10 0;
     0 0 0 0 0 1e-10];

R_1 = M(1,:) * (1 + (1e8+64e5)/norm(M(1,:))) + [0 64e5 0] ;
R_2 = M(1,:) * (1 + (1e8+64e5)/norm(M(1,:))) + [0 -64e5 0] ;

State_X = [T(2:size(T,1)),M(2:size(M,1),:)];
for i=1:1:size(M,1)-1
   State_X(i,5:7) = (M(i+1,:) - M(i,:))/(T(i+1)-T(i));  
end

x = zeros(size(M,1),6);
K = zeros(6,6,size(M,1));
K(:,:,1) = eye(6);

for i=2:1:size(M,1)-1
    
    F = calc_F(State_X((i-1):i,:));
    x_p = predict_x(F,x(i-1,:));
    K_p = predict_K(F,K(:,:,i-1));

    H = calc_H(State_X(i,:),R_1,R_2);
    a = calc_a(K_p,H,R);
    %y = calc_y(H);
    
    x(i,:) = refine_x(x_p,a,H,R)'; 
    K(:,:,i) = refine_K(a,H,K_p); 
    save('Kalman_filter_2.mat');
    
    
    %plot(x(1:i,1),I(1:i));
    %drawnow
    
end
