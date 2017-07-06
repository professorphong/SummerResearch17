function [W] =  weylcoeff(y, D)
% Discrete Weyl Transform
% Given a vectorized signal y, we define its Weyl coefficients w_{a,b}(y):
%
% w_{a,b}(y) = 1/(2^{m/2}) Tr[yy'D(a,b)]
%
% where a=(a_{m-1} ... a_0) and b=(b_{m-1} ... b_0) are binary $m$-tuples, 
% and the D(a,b) are multiscale signed permutation matrices from the binary 
% Heisenberg-Weyl group

% Qiang Qiu, 01/02/2014
% qiang.qiu@duke.edu

M=y*y';
N=size(D,1);
m=log2(N); % 2^m

W=zeros(size(D));
for a=1:N
    for b=1:N
        W(a,b) = (1/2^(m/2))*trace(M*D{a,b});
    end
end