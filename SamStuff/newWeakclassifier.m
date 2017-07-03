function [h,f,parameters] = newWeakclassifier(x,ScaleRange,p,theta)
%x is a 24x24 integrated image, 
%ScaleRange gives the range of scales used on the features = [min_scale, max_scale] 

[parameters,f] = AllHaarweights(x,ScaleRange);
     
h = zeros(f,1);

for b = 1:f
    if p*parameters(b,1) < p*theta
        h(b) = 1;
    else
        h(b) = 0;
    end
end

