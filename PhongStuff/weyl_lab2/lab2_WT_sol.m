%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lab 2: Discrete Weyl Transform
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Qiang Qiu 
% qiang.qiu@duke.edu

% Given a vectorized signal y, we define its Weyl coefficients w_{a,b}(y):
%
% w_{a,b}(y) = 1/(2^{m/2}) Tr[yy'D(a,b)]
%
% where a=(a_{m-1} ... a_0) and b=(b_{m-1} ... b_0) are binary $m$-tuples, 
% and the D(a,b) are multiscale signed permutation matrices from the binary 
% Heisenberg-Weyl group


%% Image (Patch) Weyl Representation
% Given a N-sized vectorized signal y, its Weyl representation is a mapping
% between its N by N covariance matrix and Weyl coefficient vectors of length N^2 
% in real Euclidean space. 

% Note: it is an isometry, the Frobenius norm of the matrix and the
% Euclidean norm of the vector are equal.

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% Compute Weyl coefficients of a 4 by 4 image 'img/1.jpg', and show it is
% an isometry.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




% %%%%%%%%
% Answer: 
% %%%%%%%%
y = double(imread('img/1.jpg'));
% figure; imshow(y, []);
y=y(:);

m = log2(length(y(:)));
[D, ~, ~] =  HW(m);
[W] =  weylcoeff(y, D);
figure; plot(1:length(W(:)), W(:));

% show isometry
S=y(:)*y(:)';
S(:)'*S(:) - W(:)'*W(:)
% %%%%%%%%


%% Weyl transform invariance property
% Let w_{a,b}(y) be the Weyl coefficients of y. If y2=D(a',b')y, then, for all (a,b), 
% |w_{a,b}(y2)|=|w_{a,b}(y)|


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% Show that whenever a D(a,b) matrix is applied to the 4 by 4 image 'img/1.jpg',
% the magnitudes of its Weyl coefficients are unchanged.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% %%%%%%%%
% Answer: 
% %%%%%%%%

y = double(imread('img/1.jpg'));
m = log2(length(y(:)));
[D, A, B] =  HW(m);

% randomly pick D(0001, 0010) as an example transformation
y2= D{2, 3}*y(:);

[W] =  weylcoeff(y(:), D);
[W2] =  weylcoeff(y2(:), D);
sum(sum( abs(W)-abs(W2) )) % verify magnitudes unchange

figure; hold on;
plot(1:length(W(:)), W(:), 'r');
plot(1:length(W2(:)), W2(:), 'b');
% %%%%%%%%




%%  Orthonormal basis 
% 1/(2^{m/2}) D(a,b) form an orthonormal basis,
% and any linear operator S can be expanded in terms of D(a,b)


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% Show that the image 'img/1.jpg' can be reconstructed from its Weyl
% coefficients.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% %%%%%%%%
% Answer: 
% %%%%%%%%
y = double(imread('img/1.jpg'));
y=y(:);

m = log2(length(y));
[D, ~, ~] =  HW(m);
[W] =  weylcoeff(y, D);
[y_recons] =  weyl_recons(W, D);

if min(min(y_recons))<0 y_recons = -1*y_recons; end

figure; 
subplot(2,1,1); plot(1:length(y(:)), y(:));
subplot(2,1,2); plot(1:length(y_recons(:)), y_recons(:));
% %%%%%%%%



%% a'b = 0 vs. a'b = 1
% The set of all real symmetric matrices is a vector space, denoted as V
% 1/(2^{m/2}) D(a,b), a'b=0 form an orthonormal basis for V

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% Show that the Weyl coefficients of image 'img/1.jpg' are all zero when
% a'b=1
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% %%%%%%%%
% Answer: 
% %%%%%%%%
y = double(imread('img/1.jpg'));
y=y(:);

m = log2(length(y));
[D, ~, ~] =  HW(m);
[W] =  weylcoeff(y, D);

W_sym=[]; % symmetric
W_ssym=[]; % skew symmetric

for a=0:2^m-1
    a_bin = intobinary(a,m);
    for b=0:2^m-1
        b_bin = intobinary(b,m);
        
        if mod(a_bin'*b_bin,2)==0
            W_sym=[W_sym W(a+1, b+1)];
        else
           W_ssym=[W_ssym W(a+1, b+1)]; 
        end
        
    end
end

figure; 
subplot(2,1,1); plot(1:length(W_sym), W_sym); title('ab=0');
subplot(2,1,2); plot(1:length(W_ssym), W_ssym); title('ab=1');
% %%%%%%%%


