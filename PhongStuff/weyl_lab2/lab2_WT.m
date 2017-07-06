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







%% Weyl transform invariance property
% Let w_{a,b}(y) be the Weyl coefficients of y. If y2=D(a',b')y, then, for all (a,b), 
% |w_{a,b}(y2)|=|w_{a,b}(y)|


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% Show that whenever a D(a,b) matrix is applied to the 4 by 4 image 'img/1.jpg',
% the magnitudes of its Weyl coefficients are unchanged.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%%  Orthonormal basis 
% 1/(2^{m/2}) D(a,b) form an orthonormal basis,
% and any linear operator S can be expanded in terms of D(a,b)


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% Show that the image 'img/1.jpg' can be reconstructed from its Weyl
% coefficients.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%









%% a'b = 0 vs. a'b = 1
% The set of all real symmetric matrices is a vector space, denoted as V
% 1/(2^{m/2}) D(a,b), a'b=0 form an orthonormal basis for V

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise: 
% %%%%%%%%
% Show that the Weyl coefficients of image 'img/1.jpg' are all zero when
% a'b=1
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







