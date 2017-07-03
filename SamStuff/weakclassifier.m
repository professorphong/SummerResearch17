function h = weakclassifier(x,f,position,scale,p,theta)
%x is a 24x24 integrated image, f is a feature,position is a 1x2 vector containing the x and y coordinates of f, 
%,p is the polarity, and t is a threshold. 

L = length(f);

fx = Haarweight(x,f,scale(1),scale(2),position,2,L);
     
if p*fx < p*theta
    h = 1;
else
    h = 0;
end


