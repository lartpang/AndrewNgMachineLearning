function out = mapFeature(X1, X2)
% MAPFEATURE Feature mapping function to polynomial features
%
%   MAPFEATURE(X1, X2) maps the two input features
%   to quadratic features used in the regularization exercise.
%
%   Returns a new feature array with more features, comprising of 
%   X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..
%
%   Inputs X1, X2 must be the same size
% 本函数自动组合各种特征可能

degree = 6;
out = ones(size(X1(:, 1)));
for i = 1: degree
    for j = 0: i
        out(:, end + 1) = (X1 .^ (i - j)) .* (X2 .^ j); 
        % end 最大索引，相当于新添了一列，每次循环中，阶数和一致
        %fprintf('X1^%d ; X2^%d\n', i-j, j);
    end
end

end