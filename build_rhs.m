function rhsvec = build_rhs(xs,ys,alpha)
np = length(xs) - 1;
rhsvec = zeros(1,np+1);
for j = 2:np
    rhsvec(j) = (ys(j-1)-ys(j))*cos(alpha) - (xs(j-1)-xs(j))*sin(alpha);
end 
rhsvec =transpose(rhsvec);
end 