function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).
% 注意这里使用的运算符，即使是数字除以矩阵也要使用 ./ 因为矩阵的 / 运算实际上就是 （* pinv()） 运算

g = 1 ./ (1 + (exp(-1 * z)));

% =============================================================

end
