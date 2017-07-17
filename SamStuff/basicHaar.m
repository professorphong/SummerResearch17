function [img] = basicHaar(I);

I2 = rgb2gray(I);
dimensions = size(I2);

I3 = imresize(I2,[24,24]); I4 = integralimage(I3);