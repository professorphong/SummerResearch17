function [I,S,Diff] = basicHaarEyes(A)

A2 = im2bw(A); % converts A into a binary image
H = imread('HaarVerticalBW.j2c'); %a Haar feature meant to detect eyes (binary image)

H = logical(imresize(H,[50,50]));

rowH = size(H,1);
colH = size(H,2);
rowA = size(A2,1);
colA = size(A2,2);

%Do one iteration before the while loop
r1 = randi(rowA - rowH); %The coordinates of the entry of A taken to be the first entry of M
c1 = randi(colA - colH);

coord = [r1, c1];

M = logical(A2(r1:(r1 + rowH - 1), c1:(c1 + colH - 1))); %This is an nxn matrix whose entries are taken from A

S = sum(sum(abs(M-H))); %This gives a measure of how similar M and H are.

%Repeat the above process with a while loop, and compre the new result to the old result
n = 0;
while n < 10000
    r1 = randi(rowA - rowH); %New random coordinates
    c1 = randi(colA - colH);

    M = logical(A2(r1:(r1 + rowH - 1), c1:(c1 + colH - 1)));
   
    S2 = sum(sum(abs(M-H)));

    if S2 < S
        S = S2;
        coord = [r1, c1];
    else
    end

    n = n + 1;
end

%Replace the eye area of A with the Haar feature

Diff = abs(M-H)

figure
A2(r1:(r1+rowH-1),c1:(c1+colH-1)) = H; 

I = A2;

S

imshow(I);

end


