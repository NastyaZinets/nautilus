function [K] = refine_K(a,H,K_p)

K = (eye(6) - a*H)*K_p;

end