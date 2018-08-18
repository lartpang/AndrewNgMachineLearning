function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% mu = mean(X);
% X_norm = bsxfun(@minus, X, mu);
% 
% sigma = std(X_norm);
% X_norm = bsxfun(@rdivide, X_norm, sigma);

mu = mean(X);
sigma = std(X);
X_norm = (X - mu) ./ sigma;
% 高版本matlab建议直接使用运算符即可
% 注意，是 ./

% ============================================================

end
