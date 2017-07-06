function D_ab =  HW_ab(a,b)
% Generate D_ab at (a,b)
% a, b: binary string of same length, e.g., a='1011'; b='0101';

% Qiang Qiu, 01/02/2014
% qiang.qiu@duke.edu

m=length(a);

% Dihedral Group D4
X=[0 1; 1 0];
Z=[1 0; 0 -1];

D_a0 = X^str2num(a(length(a)));
for ii=length(a)-1:-1:1
    D_a0=kron(D_a0, X^str2num(a(ii)));
end


D_0b = Z^str2num(b(length(b)));
for jj=length(b)-1:-1:1
    D_0b=kron(D_0b, Z^str2num(b(jj)));
end

D_ab = D_a0*D_0b;
