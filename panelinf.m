function [infa,infb] = panelinf(xa,ya,xb,yb,x,y)
%gives the value at (x,y) of the influence coefficients of arbitrary vortex 
%panel that has end points (xa,ya) and (xb,yb).
r = [x-xa,y-ya];

t = [xb-xa,yb-ya];
del = norm(t);
t = t/norm(t);

n = [-(yb-ya)/(xb-xa),1];
n = n/norm(n);

X = dot(r,t);
Y = dot(r,n);

[infa,infb] = refpaninf(del,X,Y);

end

