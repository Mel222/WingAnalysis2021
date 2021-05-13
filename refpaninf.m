function [infa,infb] = refpaninf(del,X,Yin)
%refpaninf gives the values of the 'influence coefficients' at the point 
%(X,Y) of the streamfunction for a vortex-sheet panel, of size del
if abs(Yin) < 1e-8
    Y = 1e-8;
else
    Y = Yin;
end

X2Y2 = X^2+Y^2;
Xmdel = X - del;

I0 = X*log(X2Y2) - Xmdel*log(Xmdel^2 + Y^2) - 2*del ...
    + 2*Y*(atan(X/Y) - atan(Xmdel/Y));
I0 = -I0/4/pi;

I1 = X2Y2*log(X2Y2) - (Xmdel^2+Y^2)*log(Xmdel^2+Y^2) - 2*X*del + del^2;
I1 = I1/8/pi;

infa = (1-X/del)*I0 - I1/del;
infb = X/del*I0 + I1/del;
end

