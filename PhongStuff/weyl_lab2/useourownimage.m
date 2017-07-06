%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lab 4: Texture Representation using Weyl Coefficient
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Qiang Qiu 
% qiang.qiu@duke.edu


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% Randomly sample 500 patches from texture 'img/cottonBlue.png' and
% 'img/fabric.png' respectively. Represent each patch using Weyl
% Coefficients invariant to the group of transformations G defined in Lab 3. 
% Visualized patch Weyl and intensity (raw pixel value) representations of both 
% textures with the dimension reduced to 3 using PCA. 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Note: We suggest to randomly sampled 16x16 patches from each texture. 
% Each patch is broken down into smaller 4 by 4 sub-patches, their Weyl transforms 
% calculated, and their absolute values summed accordingly over all sub-patches  



% %%%%%%%%
% Answer: 
% %%%%%%%%
rng(1, 'twister')

texture1 = 'img/cottonBlue.png'; 
texture2 = 'img/fabric.png';

%% sample 500 random patches from a texture image: cottonBlue
rng(1, 'twister')

img1=imread(texture1);
%  figure; imshow(img, []);
 
 img=rgb2gray(img1);
 img=imresize(img, [400 400]);
 
 
N=16;  
patchsize=N;
patchnum=500;
[patch] = samplePatch(img, patchsize, patchnum);

% figure; 
% for i=1:10
%        subplot(1, 10, i); 
%        imshow(reshape(patch(:,i), [patchsize patchsize]),[]);
% end

X=double(patch);


%% sample 500 random patches from another texture image: fabric
rng(1, 'twister')

 img2=imread(texture2);
%  figure; imshow(img, []);
 
 img=rgb2gray(img2);
 img=imresize(img, [400 400]);
 
 
N=16;  
patchsize=N;
patchnum=500;
[patch] = samplePatch(img, patchsize, patchnum);

% figure; 
% for i=1:10
%        subplot(1, 10, i); 
%        imshow(reshape(patch(:,i), [patchsize patchsize]),[]);
% end

X2=double(patch);

%% Compute Weyl Representation for texture cottonBlue

WM=[];
for s=1:size(X,2)
    y=X(:,s);
    y=X(:,s)-mean(X(:,s));
    y=normcol(y);
    y=reshape(y, N, N);

    wm=[];
    for ss=1:N/4
        for tt=1:N/4
            yy = y((ss-1)*4+1:(ss-1)*4+4, (tt-1)*4+1:(tt-1)*4+4);
            yy=normcol(yy(:));
            [ws] = weyl_squashed(yy(:));
            wm=[wm abs(ws(:))];
        end
    end
    wm=sum(wm,2)/((N/4)*(N/4));
    
    WM=[WM wm];
end



%% Compute Weyl Representation for texture fabric
 
WM2=[];
for s=1:size(X2,2)
    y=X2(:,s);
    y=X2(:,s)-mean(X2(:,s));
    y=normcol(y);
    y=reshape(y, N, N);

    wm=[];
    for ss=1:N/4
        for tt=1:N/4
            yy = y((ss-1)*4+1:(ss-1)*4+4, (tt-1)*4+1:(tt-1)*4+4);
            yy=normcol(yy(:));
            [ws] = weyl_squashed(yy(:));
            wm=[wm abs(ws(:))];
        end
    end
    wm=sum(wm,2)/((N/4)*(N/4));
    
    WM2=[WM2 wm];
end


%% Weyl representation visualized with the dimension reduced to 3 using PCA
figure;
subplot(2,2,1); imshow(img1,[]);
subplot(2,2,2); imshow(img2,[]);

no_dims=3;
[mappedX, ~] = pca([WM';WM2'], no_dims);
label = [ones(1, size(WM,2)) 2*ones(1, size(WM2,2))];
subplot(2,2,3); scatter3(mappedX(:,1), mappedX(:,2), mappedX(:,3), 50, label, 'fill');
% figure; scatter(mappedX(:,1), mappedX(:,2), 50, label, 'fill');
title('Weyl');

% Raw intensity representation visualized with the dimension reduced to 3 using PCA
no_dims=3;
[mappedX, ~] = pca([X';X2'], no_dims);
label = [ones(1, size(X,2)) 2*ones(1, size(X2,2))];
subplot(2,2,4); ; scatter3(mappedX(:,1), mappedX(:,2), mappedX(:,3), 50, label, 'fill');
% figure; scatter(mappedX(:,1), mappedX(:,2), 50, label, 'fill');
title('Intensity');






