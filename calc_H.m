function [H] = calc_H(State,R_1,R_2)

r_12 = State(2:4) - R_1;
r_23 = State(2:4) - R_2;

v_12 = r_12/norm(r_12)*dot(State(5:7),r_12/norm(r_12));
v_23 = r_23/norm(r_23)*dot(State(5:7),r_23/norm(r_23));
dD = 1/2*[v_12*r_12'/norm(r_12)+v_23*r_23'/norm(r_23)];

H = 1/2*[v_12'/norm(r_12)+v_23'/norm(r_23)-dD*(r_12'/norm(r_12)+r_23'/norm(r_23));
         r_12'/norm(r_12)+r_23'/norm(r_23)];

H = diag(H);     
     
     
end