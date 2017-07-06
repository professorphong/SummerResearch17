function [Bt,ht,w,et] = AdaboostAttempt(x,y,T,ScaleRange)
n = numel(y);

%% Create a vector of the weights
    %weights will go here
    w = zeros(T+1,n);  wtemp = y;
    %Find the number of negative (m) and positive (l) images
    m = numel(y(y==0)); l = numel(y(y==1));
    %replace the entreis of w with the appropriate values
    wtemp(wtemp==0) = 1/(2*m); wtemp(wtemp==1) = 1/(2*l);
    %Normalize the weights
    wtemp = wtemp/(sum(wtemp));
    
    w(1,:) = wtemp;
    %% Epsilon stuff
    theta = [0.05:0.05:1];
    
    
    ht = zeros(T+1,7); %ht(t,:) = [base_feature_t, x_coord_t, y_coord_t, x_scale_t, y_scale_t, polarity_t, threshold_t]
    Bt = zeros(T+1,1);
    et = zeros(T+1,1);
    
    %Generate each f(x), where f is a feature
    [fx1,F] = AllHaarweights(x(:,:,1),ScaleRange);
    fx_all = zeros(F,n,6);
    fx_all(:,1,:) = fx1;
    for N = 2:n
       fx_all(:,N,:) =  AllHaarweights(x(:,:,N),ScaleRange);
    end
    
    
for t = 1:T
    e = 0;
    %A first value of epsilon
    for j = 1:n
        e = e + w(t,j)*abs(weakclassifier3(fx_all(1,j,1),1,0.05) - y(j));
    end
    hx = zeros(1,n); 
    hxnew = zeros(1,n);
    enew = 0;
     for k = 1:F
        for pol = [-1 1]
            for thet = theta
                for N = 1:n
                   h_minus_y = abs(weakclassifier3(fx_all(k,N,1),pol,thet) - y(N));
                   enew = enew + w(t,N)*h_minus_y;
                   hxnew(N) = h_minus_y;
                end
   
                if enew < e
                    e = enew;
                    hx = hxnew;
                    ht(t+1,:) = [permute(fx_all(k,1,2:6),[1 3 2]), pol thet];
                    et(t+1) = e;
                    Bt(t+1) = (e/(1-e));
                end
                enew = 0;
            end
        end
    end
    
    for j = 1:n
        if hx(j) == 0
            w(t+1,j) = w(t,j)*Bt(t+1);
        else
            w(t+1,j) = w(t,j);
        end
    end
    w(t+1,j) = w(t+1,j)/(sum(w(t+1,j)));
end
