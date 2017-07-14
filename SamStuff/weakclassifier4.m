function h = weakclassifier4(x,f,position,scale,p,theta,FullCascade,FpL)
%x is a 24x24 integrated image, f is a number representing one of the five base features used for my adaboost,
%position is a 1x2 vector containing the x and y coordinates of f, 
%,p is the polarity, and t is a threshold. 

L = length(f);


if f == 1
    fx = Haarweight(x,[1 0],scale(1),scale(2),position,2,L);
elseif f == 2
    fx = Haarweight(x,[1 0 1],scale(1),scale(2),position,2,L);
elseif f == 3
    fx = Haarweight(x,[1; 0],scale(1),scale(2),position,2,L);
elseif f == 4
    fx = Haarweight(x,[1;0;1],scale(1),scale(2),position,2,L);
elseif f == 5
    fx = Haarweight(x,[1 0;0 1],scale(1),scale(2),position,2,L);
else
    f
    position
    scale
    p
    theta
    FullCascade
    FpL
end

     
if p*fx < p*theta
    h = 1;
else
    h = 0;
end