function [weights,f] = AllHaarweights(I,ScaleRange)
%I is a 24x24 integrated image. 
%ScaleRange gives the range of scales used on the features = [min_scale, max_scale] 

%% Do some combinatorics to figure out how many features we will have
H1xmax = min([ScaleRange(2), 11]); H1ymax = min([ScaleRange(2), 23]);
H2xmax = min([ScaleRange(2), 7]); H2ymax = min([ScaleRange(2), 23]);
H3xmax = min([ScaleRange(2), 23]); H3ymax = min([ScaleRange(2), 11]);
H4xmax = min([ScaleRange(2), 23]); H4ymax = min([ScaleRange(2), 7]);
H5xmax = min([ScaleRange(2), 11]); H5ymax = min([ScaleRange(2), 11]);

%the number of features/locations for a 2 rectangle base feature
tot2block = 0;
for p = ScaleRange(1):H1xmax
   for q = ScaleRange(1):H1ymax
      tot2block = tot2block + (24 - 2*p)*(24 - q);
   end
end

%number of features/locations for a 3 rectangle base feature
tot3block = 0;
for p = ScaleRange(1):H2xmax
   for q = ScaleRange(1):H2ymax
      tot3block = tot3block + (24 - 3*p)*(24 - q);
   end
end

%the number of features/locations for a 4 rectangle base feature
tot4block = 0;
for p = ScaleRange(1):H5xmax
   for q = ScaleRange(1):H5ymax
      tot4block = tot4block + (24 - 2*p)*(24 - 2*q);
   end
end

total = 2*tot2block + 2*tot3block + tot4block;

%% 

f = 0;
weights = zeros(total,6); %weights(f,:) = [H(x), Base_feature, x_coord, y_coord, x_scale, y_scale] 

H1 = [1 0];%=>1 
H2 = [1 0 1];%=>2
H3 = [1;0]; H4 = [1;0;1]; H5 = [1 0;0 1];

%Evaluate every feature based on H1


for p = ScaleRange(1):H1xmax %Set the x scale
    for j = (p+1):(24 - p) %Set the range of x coords
        for q = ScaleRange(1):H1ymax %Set the y scale
            for k = (q+1):(24) %Set the range of y coords
                f = f + 1;
                G = HaarGen(H1,p,q,[j k]);
                b = 0;
                w = 0;
                %Evaluate the integral image
                for i = 1:2
                  if G(i,3) == 1
                      w = w + I(G(i,2),G(i,1)) - I(G(i,2) - q,G(i,1)) - I(G(i,2),G(i,1) - p) + I(G(i,2) - q,G(i,1) - p);
                  elseif G(i,3) == 0
                      b = b + I(G(i,2),G(i,1)) - I(G(i,2) - q,G(i,1)) - I(G(i,2),G(i,1) - p) + I(G(i,2) - q,G(i,1) - p);
                  end
                  weight = w - b;
                  weights(f,:) = [weight, 1, j, k, p, q];
                end
            end
        end
    end
end

%Evaluate every feature based on H2


for p = ScaleRange(1):H2xmax %Set the x scale
    for j = (p+1):(24 - 2*p) %Set the range of x coords
        for q = ScaleRange(1):H2ymax %Set the y scale
            for k = (q+1):(24) %Set the range of y coords
                f = f + 1;
                G = HaarGen(H2,p,q,[j k]);
                b = 0;
                w = 0;
                %Evaluate the integral image
                for i = 1:3
                  if G(i,3) == 1
                      w = w + I(G(i,2),G(i,1)) - I(G(i,2) - q,G(i,1)) - I(G(i,2),G(i,1) - p) + I(G(i,2) - q,G(i,1) - p);
                  elseif G(i,3) == 0
                      b = b + I(G(i,2),G(i,1)) - I(G(i,2) - q,G(i,1)) - I(G(i,2),G(i,1) - p) + I(G(i,2) - q,G(i,1) - p);
                  end
                  weight = w - b;
                  weights(f,:) = [weight, 2, j, k, p, q];
                end
            end
        end
    end
end

%Evaluate every feature based on H3

for p = ScaleRange(1):H3xmax %Set the x scale
    for j = (p+1):(24) %Set the range of x coords
        for q = ScaleRange(1):H3ymax %Set the y scale
            for k = (q+1):(24 - q) %Set the range of y coords
                f = f + 1;
                G = HaarGen(H3,p,q,[j k]);
                b = 0;
                w = 0;
                %Evaluate the integral image
                for i = 1:2
                  if G(i,3) == 1
                      w = w + I(G(i,2),G(i,1)) - I(G(i,2) - q,G(i,1)) - I(G(i,2),G(i,1) - p) + I(G(i,2) - q,G(i,1) - p);
                  elseif G(i,3) == 0
                      b = b + I(G(i,2),G(i,1)) - I(G(i,2) - q,G(i,1)) - I(G(i,2),G(i,1) - p) + I(G(i,2) - q,G(i,1) - p);
                  end
                  weight = w - b;
                  weights(f,:) = [weight, 3, j, k, p, q];
                end
            end
        end
    end
end

%Evaluate every feature based on H4

for p = ScaleRange(1):H4xmax %Set the x scale
    for j = (p+1):(24) %Set the range of x coords
        for q = ScaleRange(1):H4ymax %Set the y scale
            for k = (q+1):(24 - 2*q) %Set the range of y coords
                f = f + 1;
                G = HaarGen(H4,p,q,[j k]);
                b = 0;
                w = 0;
                %Evaluate the integral image
                for i = 1:3
                  if G(i,3) == 1
                      w = w + I(G(i,2),G(i,1)) - I(G(i,2) - q,G(i,1)) - I(G(i,2),G(i,1) - p) + I(G(i,2) - q,G(i,1) - p);
                  elseif G(i,3) == 0
                      b = b + I(G(i,2),G(i,1)) - I(G(i,2) - q,G(i,1)) - I(G(i,2),G(i,1) - p) + I(G(i,2) - q,G(i,1) - p);
                  end
                  weight = w - b;
                  weights(f,:) = [weight, 4, j, k, p, q];
                end
            end
        end
    end
end

%Evaluate every feature based on H5

for p = ScaleRange(1):H5xmax %Set the x scale
    for j = (p+1):(24 - p) %Set the range of x coords
        for q = ScaleRange(1):H5ymax %Set the y scale
            for k = (q+1):(24 - q) %Set the range of y coords
                f = f + 1;
                G = HaarGen(H5,p,q,[j k]);
                b = 0;
                w = 0;
                %Evaluate the integral image
                for i = 1:4
                  if G(i,3) == 1
                      w = w + I(G(i,2),G(i,1)) - I(G(i,2) - q,G(i,1)) - I(G(i,2),G(i,1) - p) + I(G(i,2) - q,G(i,1) - p);
                  elseif G(i,3) == 0
                      b = b + I(G(i,2),G(i,1)) - I(G(i,2) - q,G(i,1)) - I(G(i,2),G(i,1) - p) + I(G(i,2) - q,G(i,1) - p);
                  end
                  weight = w - b;
                  weights(f,:) = [weight, 5, j, k, p, q];
                end
            end
        end
    end
end