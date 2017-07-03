function Int = integralimage(I)
%I is a black and white image, and Int is the inegral image

I = im2double(I);

rI = size(I,1); %number of rows of I
cI = size(I,2); %number of columns of I

Int = zeros(rI,cI); %Matrix with same dimensions as I

Int(1,1) = I(1,1);
%Leftmost column
for j = 2:rI
   Int(j,1) = I(j,1) + Int(j-1,1); 
end
%Top row
for j = 2:cI
   Int(1,j) = I(1,j) + Int(1,j-1);
end

%The rest of the entries
for j = 2:rI
   for k = 2:cI
    Int(j,k) = I(j,k) + Int(j-1,k) + Int(j,k-1) - Int(j-1,k-1);
   end
end


