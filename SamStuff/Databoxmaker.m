%Creates a 3d array of 24x24 integrated images (x), with a vector (y)
%where y(i) = 1 if x(:,:,i) is a face, and y(i)= 0 if x(:,:,i) is not a face.
%The file paths must be changed if you are going to use this on a different computer!
x2 = zeros(24,24,200);


for i = 1:200
   x2(:,:,i) = csvread(strcat('../images/Converted Images/Negative_converted/neg_',num2str(i),'_integral.dat')); 
end





% for i = 1:50
%     xtest(:,:,i+50) = csvread(strcat('../images/Converted Images/Negative_converted/UMD_',num2str(i+50),'_integral.dat'));
% end

y2 = zeros(1,200);

% ytest(1:50) = 1;


%For the Yale faces:
% for i = 1:10
%    x2(:,:,i+10) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceGlasses_',num2str(i),'_int.dat')); 
% end
% 
% for i = 1:10
%    x2(:,:,i+20) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceHappy_',num2str(i),'_int.dat')); 
% end
% 
% for i = 1:10
%    x2(:,:,i+30) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceleftlight_',num2str(i),'_int.dat')); 
% end
% 
% for i = 1:10
%    x2(:,:,i+40) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceNoGlasses_',num2str(i),'_int.dat')); 
% end
% 
% for i = 1:10
%    x2(:,:,i+50) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceNormal_',num2str(i),'_int.dat')); 
% end
% 
% for i = 1:10
%    x2(:,:,i+60) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceRightLight_',num2str(i),'_int.dat')); 
% end
% 
% for i = 1:10
%    x2(:,:,i+70) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceSad_',num2str(i),'_int.dat')); 
% end
% 
% for i = 1:10
%    x2(:,:,i+80) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceSleepy_',num2str(i),'_int.dat')); 
% end
% 
% for i = 1:10
%    x2(:,:,i) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceSurprised_',num2str(i),'_int.dat')); 
% end