%Creates a 3d array of 24x24 integrated images (x), with a vector (y)
%where y(i) = 1 if x(:,:,i) is a face, and y(i)= 0 if x(:,:,i) is not a face.
%The file paths must be changed if you are going to use this on a different computer!
xtest = zeros(24,24,100);


for i = 1:50
   xtest(:,:,i) = csvread(strcat('../images/Converted Images/Positive_converted/Face_',num2str(i+150),'_integral.dat')); 
end

for i = 1:50
    xtest(:,:,i+50) = csvread(strcat('../images/Converted Images/Negative_converted/UMD_',num2str(i+50),'_integral.dat'));
end

ytest = zeros(1,100);

ytest(1:50) = 1;