%d = imread('G:\My Documents\MATLAB\negative\neg-0001.jpg') will import and image

y = zeros(24,24);



for i = 1:9
    
y = imresize(imread(strcat('../images/Yale Faces/subject0',num2str(i),'.surprised.pgm')),[24,24]);

y = integralimage(y);

csvwrite(strcat('../images/Converted Images/Yale Faces converted/YaleFaceSurprised_',num2str(i),'_int.dat'),y);
end

for i = 10:15
    
y = imresize(imread(strcat('../images/Yale Faces/subject',num2str(i),'.surprised.pgm')),[24,24]);

y = integralimage(y);

csvwrite(strcat('../images/Converted Images/Yale Faces converted/YaleFaceSurprised_',num2str(i),'_int.dat'),y);
end
% I Figured out how to solve the problems described below.
        %%Notes/Ideas:
        %The only way to make a string out of a vector is with num2str(x(i)) for the individual entries
        %Concatenating most of the file path with num2str lets me use a for loop.
        %However, I cannot get the output of strcat to be understood properly by imread