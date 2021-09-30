function [x] = refine_x(x_p,a,H,R)
%s = a*H;
x = x_p + a* R * randn(6,1);
%x = (x_p - a*H*x_p + a* R * randn(6,1))'/(eye(6) - a*H);
%x = x';
end