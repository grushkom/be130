function t = t_ramp(y,yi,yf,dx)

N = length(y);
ya = [yi,y,yf];
dy = diff(y);
theta = atan(dy/dx);
g = -10;
a = -10*(sin(theta)-0.5*cos(theta));
s = ones(1, N);

for i = 1:N-2
    %t(i+1) = dx*2/(s(i)*cos(theta(i))+s(i+1)*cos(theta(i)));
    t(i+1) = -2*s(i)/(a(i+1)-500*cos(theta(i)));
    s(i+1) = s(i) + a(i+1)*t(i+1);
end 
end