function [impatch] = samplePatch(im, patch_size, patch_num)

if size(im, 3) == 3,
    im = rgb2gray(im);
else
    im = im;
end

[nrow, ncol] = size(im);

x = randperm(nrow-2*patch_size-1) + patch_size;
y = randperm(ncol-2*patch_size-1) + patch_size;

[X,Y] = meshgrid(x,y);

xrow = X(:);
ycol = Y(:);

if patch_num < length(xrow),
    xrow = xrow(1:patch_num);
    ycol = ycol(1:patch_num);
end

patch_num = length(xrow);
impatch = zeros(patch_size^2, patch_num);

for ii = 1:patch_num,    
    row = xrow(ii);
    col = ycol(ii);

        patch = im(row:row+patch_size-1,col:col+patch_size-1);   
        impatch(:,ii) = patch(:)-mean(patch(:));     
end
