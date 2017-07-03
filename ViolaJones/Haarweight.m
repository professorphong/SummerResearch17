function weight = Haarweight(I,H,xscale,yscale,pos,flag,elements)
%-I is an integreal image, H is in [1 2 3 4 5] and gives the base Haar feature
%-pos = [x,y] giving the bottom right coordinate of the first box
%-xscale,yscale number of rows of and columns first pixel respectivley
%if flag = 1 then the white a black pixels are averaged before the difference is taken.
  
%I = imresize(I,[24,24]); %create a 24x24 version of I

H1 = [1 0]; H2 = [1 0 1]; H3 = [1;0]; H4 = [1;0;1]; H5 = [1 0;0 1];
%For H1 set H = 1. For H2 set H


n = numel(H);

G = HaarGen(H,xscale,yscale,pos); %G = nx3 = (number of boxes)x(coordinates + color)

b = 0;
w = 0;

%Evaluate the integral image
for i = 1:n
  if G(i,3) == 1
      w = w + I(G(i,2),G(i,1)) - I(G(i,2) - yscale,G(i,1)) - I(G(i,2),G(i,1) - xscale) + I(G(i,2) - yscale,G(i,1) - xscale);
  elseif G(i,3) == 0
      b = b + I(G(i,2),G(i,1)) - I(G(i,2) - yscale,G(i,1)) - I(G(i,2),G(i,1) - xscale) + I(G(i,2) - yscale,G(i,1) - xscale);
  end
end

if elements == 3
    if isequal(H,[0 1 0]) == 1
        b = (1/2)*b;
    elseif isequal(H,[1 0 1]) == 1
        w = (1/2)*w;
    else
    end
else
end
%The above if loop is specifically to accomidate the features I was using
%with and uneaven amount of black and white area. This way one reigon does
%not overpower the other.



if flag == 1
    w = w*(1/(xscale*yscale));
    b = b*(1/(xscale*yscale));
else
end

weight = w - b;