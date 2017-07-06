%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lab 1: Heisenberg-Weyl group HW_{2^m} 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Qiang Qiu 
% qiang.qiu@duke.edu

% The Heisenberg-Weyl group HW_{2^m} is a remarkable group of 2^m * 2^m
% matrices that provides the framework for Fourier analysis in the binary
% world. 

% The group HW_2 is just the Dihedral group D_4 comprising the 2 by 2
% matrices that are symmetries of the square: four rotations through
% multiples of 90^o, and reflections in its four axes of symmetry.
% [1 0; 0 1]	
% [0 -1; 1 0]	
% [-1 0; 0 -1]	
% [0 1; -1 0]	
% [-1 0; 0 1]	
% [0 1; 1 0]	
% [1 0; 0 -1]	
% [0 -1; -1 0]

% The Heisenberg-Weyl group HW_{2^m} is the set of all matrices +/- D(ab)
% where a,b are binary m-tuples.

% This lab shows how HW_{2^m} is formed by taking m-fold Kronecker products
% of 2 by 2  matrices in D_4.

%% Dihedral Group D_4
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Setting
X=[0 1; 1 0]
Z=[1 0; 0 -1]


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% The matrix group {+/- X^a Z^b: a,b \in {0,1} } provides a representation
% of D_4. Show all matrices in D_4 from X and Z
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for a=0:1
    for b=0:1
    X^a*Z^b
    -X^a*Z^b
    end
end






%% D(a,0): Multiscale Permutation matrices
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Given a binary m-tuple a=(a_0 , . . . , a_{m-1}),
% compute D(a,0) as Kronecker product X^{a_{m-1}} kron X^{a_{m-2}} ...kron X^{a_{0}}
%
% Note: the leftmost terms giving coarse-scale permutations and the rightmost 
% terms giving fine-scale permutations.

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% Compute and visualize D(1011, 0000)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%%%%%%
% Answer: 
% %%%%%%%%
a='1011'; b='0000';
d_a0 =  HW_ab(a,b);
figure; imshow(d_a0, []);
%%%%%%%%



%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% Compute and visualize D(a, 0) for all binary 4-tuples
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% %%%%%%%%
% Answer: 
% %%%%%%%%
% a: all binary 4-tuples 
% b: 0
m=4;
D_a0=cell(2^m,1);
b='0000';
for i=0:2^m-1
   D_a0{i+1} = HW_ab(dec2bin(i,m), b) ;
end
% plot D_a0
figure; 
for i=1:length(D_a0)
       subplot(1, length(D_a0), i); 
       imshow(D_a0{i},[]);
       title(dec2bin(i-1,m));
end
%%%%%%%%



%

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (Optional) Exercise: 
% %%%%%%%%
% Explore eigenvectors of D(a,0)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%All are walsh function eigenvectors of D(a,0)? (YES!)
%Are all eigenvectors of D(a,0) Walsh functions? (No)



%% D(0,b): Sign change matrices
% Given a binary m-tuple b=(b_0 , . . . , b_{m-1}),
% compute D(0,b) as Kronecker product Z^{b_{m-1}} kron Z^{b_{m-2}} ...

% Note: the sign patterns are the columns of the Walsh-Hadamard transform
% matrix, also known as Walsh functions. 


%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% Compute and visualize D(0, 1011)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% Compute and visualize D(0, b) for all binary 4-tuples
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (Optional) Exercise: 
% %%%%%%%%
% Explore eigenvectors of D(0,b)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%% D(a,b) 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% Compute and visualize D(a, b) for all binary 4-tuples, where
% D(a,b) = D(a,0)D(0,b)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








