function [Bt,ht,w,et] = ViolaJonesattempt(x,y,T)
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
    %% Epsilon sheeet
    H1 = [0 1]; 
    theta = [0.05:0.05:1];
    e = 0;
    %A first value of epsilon
    for j = 1:n
        e = e + w(j)*abs(weakclassifier(x(:,:,j),H1,[3 3],[2 2],1,0.5) - y(j));
    end
    
    ht = zeros(T+1,8); %ht(t,:) = [base_feature_t, x_coord_t, y_coord_t, x_scale_t, y_scale_t, polarity_t, threshold_t]
    Bt = zeros(T+1,1);
    et = zeros(T+1,1);
    
    
     
for t = 1:T
    e = 0;
    %A first value of epsilon
    for j = 1:n
        e = e + w(t,j)*abs(weakclassifier(x(:,:,j),H1,[3 3],[2 2],1,0.5) - y(j));
    end
     enew = 0;
     hx = zeros(1,n); 
     hxnew = zeros(1,n);
     h_minus_y = 0;
    for p = [2 5 10] %The x scales for the feature 
        for j = (p+1):(24 - p) %The x positions that keep the features on the image. The smaller the scale, the more posible positions
            for q = [2 5 10]
                for k = (q+1):(24)
                    for pol = [-1 1]
                        for thet = theta
                            for N = 1:n
                                h_minus_y = abs(weakclassifier(x(:,:,N),H1,[j k],[p q],pol,thet) - y(N));
                                enew = enew + w(t,N)*h_minus_y;
                                hxnew(N) = h_minus_y;
                            end
                            if enew < e
                                e = enew;
                                hx = hxnew;
                                ht(t+1,:) = [H1 j k p q pol thet];
                                et(t+1) = e;
                                Bt(t+1) = (e/(1-e));
                            end
                            enew = 0;
                        end
                    end
                end
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
