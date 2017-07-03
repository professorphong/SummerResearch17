function e = classifierSum(x,y,f,position,scale,p,theta,w)
%x is a 24x24xL array of integrated images, where L is the number of traning inamages. y is a vector of length L with
%1 for positive images in x and 0 for negative images in x. f is a basic
%haar feature. position and scale are 1x2 vectors the give the x and y
%positions and scales of f. p is a polirity. t is a threshold. w is a set
%of L (normalized) weights.

L = length(y);
e = 0;

for k = 1:L
    h = weakclassifier(x(:,:,k),f,position,scale,p,theta);
    e = e + w(k)*abs(h - y(k));     
end

