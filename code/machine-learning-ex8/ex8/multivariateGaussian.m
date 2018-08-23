function p = multivariateGaussian(X, mu, Sigma2)
%MULTIVARIATEGAUSSIAN Computes the probability density function of the
%multivariate gaussian distribution.
%    p = MULTIVARIATEGAUSSIAN(X, mu, Sigma2) Computes the probability 
%    density function of the examples X under the multivariate gaussian 
%    distribution with parameters mu and Sigma2. If Sigma2 is a matrix, it is
%    treated as the covariance matrix. If Sigma2 is a vector, it is treated
%    as the \sigma^2 values of the variances in each dimension (a diagonal
%    covariance matrix)
% 返回多变量高斯分布的概率密度分布的值

% 特征数量
k = length(mu);

% sigma2 可能是以行向量形式，也可能是以列向量形式呈现
if (size(Sigma2, 2) == 1) || (size(Sigma2, 1) == 1)
    % diag() 设定对角矩阵，将传入的sigma2作为对角线元素
    Sigma2 = diag(Sigma2);
end

% X = bsxfun(@minus, X, mu(:)');
% 这里的mu本就是一维行向量向量，(:)的使用让其变为了列向量，再转置
% 这样就不用管原本是行向量还是列向量
X = X - mu(:)';
% 这是个分数系数，所以有 - 号
% p = (2 * pi) ^ (- k / 2) * det(Sigma2) ^ (-0.5) * ...
%     exp(-0.5 * sum(bsxfun(@times, X * pinv(Sigma2), X), 2));

% 各个样本在该式之中，除了sigma2有交集外，其他的都没有交集，所以使用乘法求结果的时候
% 结果实际上是对应相加
% 这里不太明白
p = (2 * pi) ^ (- k / 2) * det(Sigma2) ^ (-0.5) * ...
    exp(sum((-0.5 * X * pinv(Sigma2)) .* X, 2));

end