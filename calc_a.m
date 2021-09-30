function [a]= calc_a(K,H,R)

a = K*H'/(H*K*H' + R);

end