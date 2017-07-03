%Creates a 3d array of 24x24 integrated images (x), with a vector (y)
%equal 1 if the images is a face, and 0 if it is not
x = zeros(24,24,90);


for i = 1:50
   x(:,:,i) = csvread(strcat('G:\My Documents\MATLAB\Converted Images\Positive_converted\Face_',num2str(i),'_integral.dat')); 
end

for i = 1:40
    x(:,:,i+50) = csvread(strcat('G:\My Documents\MATLAB\Converted Images\Negative_converted\UMD_',num2str(i),'_integral.dat'));
end

y = zeros(1,90);

y(1:50) = 1;