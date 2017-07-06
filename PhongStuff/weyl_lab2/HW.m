function [D, A, B] =  HW(m)
% Generate Heisenberg-Weyl group HW_2^m 

% Qiang Qiu, 01/02/2014
% qiang.qiu@duke.edu

% Dihedral Group D4
X=[0 1; 1 0];
Z=[1 0; 0 -1];


% A contains all binary m-tuple  (a_0 , . . . , a_{m−1} ) set
A=cell(2^m,1);
for i=0:2^m-1
   A{i+1} = dec2bin(i,m) ;
end

% B contains all binary m-tuple (b_0 , . . . , b_{m−1} ) set
B=cell(2^m,1);
for i=0:2^m-1
   B{i+1} = dec2bin(i,m) ;
end


% compute D(a,b) for each (a,b) tuple pair
D=cell(2^m,2^m);
for i=1:length(A)
    a=A{i};
    D_a0 = X^str2num(a(length(a)));
    for ii=length(a)-1:-1:1        
        D_a0=kron(D_a0, X^str2num(a(ii)));
    end
    
    for j=1:length(B)
        b=B{j};
        D_0b = Z^str2num(b(length(b)));
        for jj=length(b)-1:-1:1          
            D_0b=kron(D_0b, Z^str2num(b(jj)));
        end
        
        D{i,j} = D_a0*D_0b;
    end
end
   


