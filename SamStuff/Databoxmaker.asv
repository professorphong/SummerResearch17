%Creates a 3d array of 24x24 integrated images (x), with a vector (y)
%where y(i) = 1 if x(:,:,i) is a face, and y(i)= 0 if x(:,:,i) is not a face.
%The file paths must be changed if you are going to use this on a different computer!
xtest = zeros(24,24,50);


for i = 1:25
   xtest(:,:,i) = csvread(strcat('../images/Converted Images/Positive_converted/Face_',num2str(i+175),'_integral.dat')); 
end

for i = 1:25
    xtest(:,:,i+25) = csvread(strcat('../images/Converted Images/Negative_converted/UMD_',num2str(i+75),'_integral.dat'));
end

ytest = zeros(1,50);

ytest(1:25) = 1;