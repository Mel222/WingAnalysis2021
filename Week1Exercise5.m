clear
close all

nx = 51;
ny = 41;

np = 100;

theta = (0:np)*2*pi/np;

alpha = pi/15;

for i = 1:np+1
    xs(i) = cos(theta(i));
    ys(i) = sin(theta(i));
end

A = build_lhs(xs,ys); 
b = build_rhs(xs,ys,alpha); 
gam = A\b; 

c = -1.75:0.25:1.75;
plot(theta/pi, gam)
% hold on 
% plot(xs,ys)
% hold off

Circ1 = sum(gam)*theta(2)
axis([0 2 -2.5 2.5])
