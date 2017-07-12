function [FullCascade,Fullat] = TrainCascadingClassifier(f,d,F_target,P_train,N_train,P_val,N_val)
%This function is used to train a cascading classifier. 
%-f is the max false positive rate per layer.
%-d is the minimum detection rate per layer.
%-F_target is the overall false positive rate.
%-P_train is an array of 24x24 integrated images of positive examples used for training each layer.
%-N_train is an array of 24x24 integrated images of negative examples used for training each layer.
%-P_val is an array of 24x24 integrated images of positive examples used for validating (testing) each layer.
%-N_val is an array of 24x24 integrated images of negative examples used for validating (testing) each layer.

%% Create Variables:

i = 1; %i gives the current layer

F(1) = 1; D(1) = 1; %F(i) is the false positive rate of the first i layers. D(i) is the detection rate of
                    %the first i layers. Here are the initial values.

N_new = N_train; %The set of negative training exaples for each layer changes based on the performance of the 
                 %previous layer. N_new is just a place to put the relevent negative examples.
                 
FullCascade = zeros(10,7,5); %This 
Fullat = zeros(2,2);

%% 

while F(i) > F_target
   i = i + 1;
   n = 0;
   F(i) = F(i - 1);
   
   x_train = cat(3,P_train,N_new);
   y_train = zeros(1,size(x_train,3));
   y_train(1:size(P_train,3)) = 1;
   
   while F(i) > f*F(i-1)
      n = n + 1;
      [at,ht,Bt,~,~] = AdaboostAttempt(x_train,y_train,n,[2 20]);
      
      x_val = cat(3,P_val,N_val);
      y_val = zeros(1,size(x_val,3));
      y_val(1:size(P_val,3)) = 1;
      
      [F(i),D(i)] = StrongClassifier(x_val,y_val,ht,Bt,n);
      
      while D(i) < d*D(i - 1)
         ht(:,7) = max((ht(:,7) - 0.005),0.005);
         
         [F(i),D(i)] = StrongClassifier(x_val,y_val,ht,Bt,n);
      end
   end
   
   FullCascade(1:size(ht,1),:,i-1) = ht; 
   Fullat(1:size(ht,1),i-1) = %need to find the at associated with the new threshold
   
   [~,~,diff] = StrongClassifier(N_train,y_train,ht,Bt,n);
   
end