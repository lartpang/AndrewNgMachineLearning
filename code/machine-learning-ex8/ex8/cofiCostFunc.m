function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
% 返回损失函数和关于用户和电影的梯度

% Unfold the U and W matrices from params
% 把传入的列数据整理成各自的矩阵，列为电影，用户
X = reshape(params(1 : num_movies * num_features), num_movies, num_features);
Theta = reshape(params(num_movies * num_features + 1 : end), ...
                num_users, num_features);

% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

% R是一个 0 1 矩阵，直接 .* 可以实现有效元素保留，无效元素置零
% 可以这样更为快速的理解(X * Theta')
% 因为需要得出的结果是和R形似的，所以行数为电影数，列数为用户数
% mxu
diff = R .* (X * Theta' - Y);
% MATLAB版本的匿名函数，@ 后接匿名函数的参数，括号后接函数体
sum_squared = @(A) sum(sum(A .^ 2));
% 正则部分是各项平方的直接累和
J = (sum_squared(diff) + lambda * (sum_squared(X) + sum_squared(Theta))) / 2;
%         mxu * uxn
X_grad = diff * Theta + lambda * X;
%              uxm * mxn
Theta_grad = diff' * X + lambda * Theta;

% =============================================================

% 各自的
grad = [X_grad(:); Theta_grad(:)];

% 对于这些向量化部分，可以利用矩阵的乘法匹配原则来直接写出来

end
