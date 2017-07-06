%Creates a 3d array of 24x24 integrated images (x), with a vector (y)
%where y(i) = 1 if x(:,:,i) is a face, and y(i)= 0 if x(:,:,i) is not a face.
%The file paths must be changed if you are going to use this on a different computer!
x = zeros(24,24,90);


for i = 1:50
   x(:,:,i) = csvread(strcat('../images/Converted Images/Positive_converted/Face_',num2str(i),'_integral.dat')); 
end

for i = 1:40
    x(:,:,i+50) = csvread(strcat('../images/Converted Images/Negative_converted/UMD_',num2str(i),'_integral.dat'));
end

y = zeros(1,90);

y(1:50) = 1;