
function [y] =  weyl_recons(W, D)

% 1/(2^{m/2}) D(a,b) form an orthonormal basis,
% and any linear operator S can be expanded in terms of D(a,b)

% Qiang Qiu, 01/02/2014
% qiang.qiu@duke.edu

N=size(D,1);
m=log2(N); % 2^m

Y=0;
% ptr=1;

for a=1:N
    for b=1:N                
        Y=Y+W(a,b)*(1/2^(m/2))*D{a,b};        
    end
end

[U S V] = svd(Y); % U*S*V'
y=U(:,1)*sqrt(S(1,1));




