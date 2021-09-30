function [F] = calc_F(State)

mu = 3.986*10^14;
x = State(1,2);
y = State(1,3);
z = State(1,4);

xx = x*x;
yy = y*y;
zz = z*z;

k = (xx+yy+zz)^(5/2);

M = mu / k * [ (2*xx-yy-zz) 3*y*x        3*z*x;
            3*y*x       (2*yy-xx-zz) 3*z*y;
            3*z*x       3*z*y        (2*zz-xx-yy)];

A = [ zeros(3,3) eye(3);
        M        zeros(3,3)];

F = eye(6) + A*(State(2,1)-State(1,1));    
    
end