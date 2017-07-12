function I = undointegralimage(Int)
%Int is an integral image taken from a grayscale, should be doubles 

rI = size(Int,1); %number of rows of Int
cI = size(Int,2); %number of columns of Int

I = zeros(rI,cI); %Matrix with same dimensions as Int

I(1,1) = Int(1,1);
%Leftmost column
for j = 2:rI
   I(j,1) = Int(j,1) - Int(j-1,1); 
end
%Top row
for j = 2:cI
   I(1,j) = Int(1,j) - Int(1,j-1);
end

%The rest of the entries
for j = 2:rI
   for k = 2:cI
    I(j,k) = Int(j,k) - Int(j-1,k) - Int(j,k-1) + Int(j-1,k-1);
   end
end