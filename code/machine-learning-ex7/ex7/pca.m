function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
% 计算的带特征向量U和特征值S

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
% U S 都是nxn的矩阵，是将 n -> k，来降维
U = zeros(n);
S = zeros(n);

% ====================== YOUR CODE HERE ======================
% Instructions: You should first compute the covariance matrix. Then, you
%               should use the "svd" function to compute the eigenvectors
%               and eigenvalues of the covariance matrix. 
%
% Note: When computing the covariance matrix, remember to divide by m (the
%       number of examples).
%

sigma = X' * X / m;
% [U, S, V] = svd(sigma);
[U, S, ~] = svd(sigma);

% =========================================================================

end
