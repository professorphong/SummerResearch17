%Creates a 3d array of 24x24 integrated images (x), with a vector (y)
%where y(i) = 1 if x(:,:,i) is a face, and y(i)= 0 if x(:,:,i) is not a face.
%The file paths must be changed if you are going to use this on a different computer!
xtest = zeros(24,24,100);


for i = 1:5
   xtest(:,:,i) = csvread(strcat('../images/Converted Images/Yale Faces converted/YaleFace_',num2str(i+10),'_int.dat')); 
end





for i = 1:50
    xtest(:,:,i+50) = csvread(strcat('../images/Converted Images/Negative_converted/neg_',num2str(i+200),'_integral.dat'));
end

ytest = zeros(1,100);

 ytest(1:50) = 1;


%For the Yale faces:
% for i = 1:5
%    xtestYale(:,:,i+5) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceGlasses_',num2str(i+10),'_int.dat')); 
% end
% 
% for i = 1:5
%    xtestYale(:,:,i+10) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceHappy_',num2str(i+10),'_int.dat')); 
% end
% 
% for i = 1:5
%    xtestYale(:,:,i+15) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceleftlight_',num2str(i+10),'_int.dat')); 
% end
% 
% for i = 1:5
%    xtestYale(:,:,i+20) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceNoGlasses_',num2str(i+10),'_int.dat')); 
% end
% 
% for i = 1:5
%    xtestYale(:,:,i+25) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceNormal_',num2str(i+10),'_int.dat')); 
% end
% 
% for i = 1:5
%    xtestYale(:,:,i+30) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceRightLight_',num2str(i+10),'_int.dat')); 
% end
% 
% for i = 1:5
%    xtestYale(:,:,i+35) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceSad_',num2str(i+10),'_int.dat')); 
% end
% 
% for i = 1:5
%    xtestYale(:,:,i+40) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceSleepy_',num2str(i+10),'_int.dat')); 
% end
% 
% for i = 1:5
%    xtestYale(:,:,i+45) = csvread(strcat('../images/Converted Images/Yale Faces Converted/YaleFaceSurprised_',num2str(i+10),'_int.dat')); 
% end