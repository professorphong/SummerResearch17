function [Fi,Di,N_fail] = TestCascadingClassifier(P,N,FullCascade,Fullat,FpL,flag)

x = cat(3,P,N);
y = zeros(1,size(x,3)); y(1:size(P,3)) = 1;

C = zeros(1,length(y));

a_sum = sum(Fullat,1);

for i = 1:length(y) %This loop goes through each image
    for j = 1:length(FpL)
        htx = zeros(FpL(j),1);
        
        for k = 1:FpL(j)
            htx(k) = weakclassifier4(x(:,:,i),FullCascade(k,1,j),[FullCascade(k,2,j) FullCascade(k,3,j)],[FullCascade(k,4,j) FullCascade(k,5,j)],FullCascade(k,6,j),FullCascade(k,7,j),FullCascade,FpL);
        end
        ahtx = Fullat(1:FpL(j),j).*htx;
        
        if sum(ahtx) < 0.5*a_sum(j)
            C(i) = 0;
            break
        else
            if j == length(FpL)
                C(i) = 1;
            else
            end
        end
    end
end

diff = abs(C - y);

%Find detection rate
Facediff = diff(y==1);

FaceCorrect = numel(Facediff(Facediff==0));

Di = FaceCorrect/(numel(y(y==1))); %Detection Rate

%Find False positive rate
Negdiff = diff(y==0);

FaceWrong = numel(Negdiff(Negdiff==1));

Fi = FaceWrong/(numel(y(y==0))); %False positive rate

if flag == 1
   N_fail = N(:,:,diff==1); 
else
    N_fail = [];
end

