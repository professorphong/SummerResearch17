function [x,y] = ImageArray(positive, negative)
%Creates a 3d array of 24x24 integrated images (x), with a vector (y)
%where y(i) = 1 if x(:,:,i) is a face, and y(i)= 0 if x(:,:,i) is not a face.
%positive is the number of face images desired and negavive is the number
%of negative images desired.
%Be carful with the filepaths, they may need to be modified.

x = zeros(24,24,(positive + negative));

for i = 1:positive
    x(:,:,i) = csvread(strcat('../images/Converted Images/Positive_converted/Face_',num2str(i),'_integral.dat'));
end

if negative < 101
   for i = 1:negative
       x(:,:,i+positive) = csvread(strcat('../images/Converted Images/Negative_converted/neg_',num2str(i),'_integral.dat'));
   end
else
   for i = 1:100
       x(:,:,i+positive) = csvread(strcat('../images/Converted Images/Negative_converted/neg_',num2str(i),'_integral.dat'));
   end
   
   for i = 1:(negative - 100)
       x(:,:,(i + positive + 100)) = csvread(strcat('../images/Converted Images/Negative_converted/UMD_',num2str(i),'_integral.dat'));
   end
end

y = zeros(1,(positive + negative));
 
y(1:positive) = 1;

