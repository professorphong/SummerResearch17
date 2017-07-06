%This is a simple Y to understand the transformations in lab 3. 
%%Some experiments for Lab 3:
%First we make the basis
m=4;
[Dab, ~, ~] =  HW(m);
%Then we make a random 4x4 matrix

%Before it was a random matrix. We would like to use a more simple matrix
%to get a better sense of the behavior
%rng(1,'twister');
%Y=round(10*rand(4:4))
Y=[0 0 0 1;
   0 0 0 1;
   0 0 0 1;
   0 0 0 1];


%We also vectorize it
Y=Y(:);

%Next we make our matrix of coefficients
[W] =  weylcoeff(Y, Dab);


%Let's stop here and check out the picture.
%figure; plot(1:length(W(:)), W(:));

%Just to be super thorough, lets also more manually check the value of one
%of the coefficients:
%val=(1/(2^(m/2)))*trace(Y*Y'*Dab{1,1});(Uncomment this line if you want to
%check it
%(It does work out)

% I should compute things using the example and show that the change in D
% works with the change in the entries of the vectorized image y.
%First we will perform a transformation of Y
pY=circshift(Y,4,1);
ppY=circshift(pY,4,1);
pppY=circshift(ppY,4,1);
ppppY=circshift(pppY,4,1);
%Now what does this do to the D values?
%Lets generate all the Weyl Coefficients, then visually match them up
%possibly.
[pW] =  weylcoeff(pY, Dab);
[ppW] =  weylcoeff(ppY, Dab);
[pppW] =  weylcoeff(pppY, Dab);
[ppppW] =  weylcoeff(ppppY, Dab);
%We can colorize the values and display them side by side
figure;
%minW=min(min(W));%computes minimum values of the matrices for rescaling purposes.
%minpW=min(min(pW));
colormap default
subplot(2,5,1)
bar3(W)
title('Original Weyl Coeff');
subplot(2,5,2)
bar3(pW)
title('Weyl Coeff After Cycle by N/4');
subplot(2,5,3)
bar3(ppW)
title('Weyl Coeff After Cycle by 2*N/4');
subplot(2,5,4)
bar3(pppW)
title('Weyl Coeff After Cycle by 3*N/4');
subplot(2,5,5)
bar3(ppppW)
title('Weyl Coeff After Cycle by 4*N/4');
subplot(2,5,6)
image(flipud(reshape(Y,4,4)))
title('Original Image')
subplot(2,5,7)
image(flipud(reshape(pY,4,4)))
title('Cycled Image by N/4')
subplot(2,5,8)
image(flipud(reshape(ppY,4,4)))
title('Cycled Image by 2*N/4')
subplot(2,5,9)
image(flipud(reshape(pppY,4,4)))
title('Cycled Image by 3*N/4')
subplot(2,5,10)
image(flipud(reshape(ppppY,4,4)))
title('Cycled Image by 4*N/4')
