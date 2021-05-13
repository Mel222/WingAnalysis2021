function [psixy] = psipv(xc,yc,Gamma,x,y)
%psipv outputs the value of the streamfunction at the point (x,y) due to a 
%point vortex of strength Gamma, centred at (xc,yc)
    r2 = (x - xc)^2 + (y - yc)^2;
    psixy = -Gamma/4/pi * log(r2);
end