function [K_p] = predict_K(F,K)

K_p = F * K * F';

end