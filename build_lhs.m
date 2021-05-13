function lhsmat = build_lhs(xs,ys)
np = length(xs) - 1; 
psip = zeros(np,np+1);

for i = 1:np 
    
    [infa,~] = panelinf(xs(1),ys(1),xs(2),ys(2),xs(i),ys(i));  
    psip(i,1) = infa;
    
    for j = 2:np
        [~,infb] = panelinf(xs(j-1),ys(j-1),xs(j),ys(j),xs(i),ys(i));
        [infa,~] = panelinf(xs(j),ys(j),xs(j+1),ys(j+1),xs(i),ys(i));
        
        psip(i,j) = infa + infb;
    end
    
    [~,infb] = panelinf(xs(np),ys(np),xs(np+1),ys(np+1),xs(i),ys(i));  
    psip(i,np+1) = infb;
  
end

lhsmat = zeros(np+1,np+1);
lhsmat(1,1) = 1;
lhsmat(np+1,np+1) = 1;

for i = 2:np
    for j = 1:np+1
        lhsmat(i,j) = psip(i,j) - psip(i-1,j);
    end
end 

