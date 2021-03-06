function [F_pos_rate,Detection_Rate,diff,Correct,C,Incorrect,TotalAccuracy,NegAccuracy] = StrongClassifier(x,y,ht,Bt,T)
%This function creates a strong classifier from the information generated
%by AdaboostAttempt.m

Bt = Bt(1:T);

%x is a single image. Bt and ht are outputs from AdaboostAttempt.m
%C = 1 if x is a face, and C = 0 if x is not a face


C = zeros(1,length(y));

%Determine each alpha_t from each Beta_t 
at = log(1./Bt);

%Sum up all of the alphas
a_sum = sum(at);


for k = 1:length(y)
    %create a place to put each h_t(x)
    htx = zeros(size(Bt,1),1);

    %Evaluate the image with the weak classifiers. There is an if loop to
    %account for the 5 different base Haar features. 
    for j = 1:size(Bt,1)
       if ht(j,1) == 1
           htx(j) =  weakclassifier(x(:,:,k),[1 0],[ht(j,2) ht(j,3)],[ht(j,4) ht(j,5)],ht(j,6),ht(j,7));
       elseif ht(j,1) == 2
           htx(j) =  weakclassifier(x(:,:,k),[1 0 1],[ht(j,2) ht(j,3)],[ht(j,4) ht(j,5)],ht(j,6),ht(j,7));
       elseif ht(j,1) == 3
           htx(j) =  weakclassifier(x(:,:,k),[1; 0],[ht(j,2) ht(j,3)],[ht(j,4) ht(j,5)],ht(j,6),ht(j,7));
       elseif ht(j,1) == 4
           htx(j) =  weakclassifier(x(:,:,k),[1;0;1],[ht(j,2) ht(j,3)],[ht(j,4) ht(j,5)],ht(j,6),ht(j,7));
       elseif ht(j,1) == 5
           htx(j) =  weakclassifier(x(:,:,k),[1 0;0 1],[ht(j,2) ht(j,3)],[ht(j,4) ht(j,5)],ht(j,6),ht(j,7));
       end
    end
    %Multiply the alphas and the evaluated weak classifiers entrywise. 
    ahtx = at.*htx;

    %Sum up the product vector
    ahtx_sum = sum(ahtx);

    %Check the inequality. 
    if ahtx_sum >= 0.5*a_sum
        C(k) = 1;
    else 
        C(k) = 0;
    end
end

diff = abs(C - y);

Correct = numel(diff(diff==0));

Incorrect = numel(y) - Correct;

TotalAccuracy = Correct/(numel(y));

Facediff = diff(y==1);

FaceCorrect = numel(Facediff(Facediff==0));

Detection_Rate = FaceCorrect/(numel(y(y==1)));

Negdiff = diff(y==0);

NegCorrect = numel(Negdiff(Negdiff==0));

NegAccuracy = NegCorrect/(numel(y(y==0)));

%Find False positive rate
FaceWrong = numel(Negdiff(Negdiff==1));

F_pos_rate = FaceWrong/(numel(y(y==0)));
