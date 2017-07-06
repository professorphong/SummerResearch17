function [WS] = weyl_squashed(y)
% Implement Weyl transform as a combination of autocorrelations and
% Walsh-Hadamard transform 
%((this is a hard code of the example in lab 3.))
zero = dec2bin(zeros(1,16),4);
zero2 = dec2bin(0,4);
bin = dec2bin(0:15,4)-zero;
powers = [];
for j = 1:4
powers = [2^(j-1); powers];
end

for a = 1:16

a_bin = dec2bin(a-1,4)-zero2;
bin_trans = mod(bin + repmat(a_bin,[16 1]),2);

p(:,a) = bin_trans*powers+1;

end

class_labels_p = [1 2 4 4 2 3 5 5 4 5 6 6 4 5 6 6];
class_labels_q = [1 4 2 4 4 6 5 6 2 5 3 5 4 6 5 6];

for k = 1:5

fp{k} = find(class_labels_p==k+1);

for l = 1:6

fq{l} = find(class_labels_q==l);

end

end

atb = ([1:9 11:12 15:16 18:21 23:25 27:30])';


aut = repmat(y,[1 16]).*y(p);
W = 4*fwht(aut,[],'hadamard');%when you do the original weyl coeff calculations we can instead do it this way faster.

for p = 1:5

for q = 1:6

Wpq = W(fp{p},fq{q});
WS(p,q) = norm(Wpq(:),1)/length(Wpq(:));

end

end

WS = WS(atb);