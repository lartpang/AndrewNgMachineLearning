function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.
% ÌØÕ÷Ëõ·Å£¬¶ÔÃ¿Ò»¸öÌØÕ÷¹éÒ»»¯

mu = mean(X);
sigma = std(X);

% 一个输入是矩阵，另一个输入是三维数组。这些维度要么都相同，要么其中一个为 1。
X_norm = (X - mu) ./ sigma;

% ============================================================

end
