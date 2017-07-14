function [at,Bt,et] = UpdateCoefficients(w,ht,x,y)

L = size(ht,1); %The number of rounds
n = length(y);

et = zeros(L,1);


for j = 1:L
    for k = 1:n
        et(j) = et(j) + w(j+1,k)*abs(weakclassifier4(x(:,:,k),ht(j,1),[ht(j,2) ht(j,3)],[ht(j,4) ht(j,5)],ht(j,6),ht(j,7)) - y(k));
    end
end

Bt = et./(1 - et);

at = log(1./Bt);
