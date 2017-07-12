
function I = pixelReplace(A,B,a) 
%The function replaces some of the pixels of image A with image B. 
%B Should be smaller than A. a is a 1x2 vector that represents the coordinate of A where the top
%right corner of B will be placed.
rowA = size(A,1);
colA = size(A,2);
rowB = size(B,1);
colB = size(B,2);

%Make sure B is smaller than A
if rowA < rowB 
    B = imresize(B,[((rowA+colA)/(10*rowB))*rowB,((rowA+colA)/(10*rowB))*colB]);
else
end

if colA < colB
    B = imresize(B,[((rowA+colA)/(10*colB))*rowB,((rowA+colA)/(10*colB))*colB]);
else
end
    
%Make sure B is contained in A
if (a(1) + rowB) > rowA 
    a(1) = rowA - rowB;
else
end

if (a(2) + colB) > colA
    a(2) = colA - colB;
else
end

I = A;

%Replace the desired pixels of A with the pixels of B
I(a(2):(a(2)+colB-1),a(1):(a(1)+rowB-1)) = B; 

figure
imshow(I)

end

  