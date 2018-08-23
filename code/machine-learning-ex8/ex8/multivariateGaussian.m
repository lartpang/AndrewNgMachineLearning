function p = multivariateGaussian(X, mu, Sigma2)
%MULTIVARIATEGAUSSIAN Computes the probability density function of the
%multivariate gaussian distribution.
%    p = MULTIVARIATEGAUSSIAN(X, mu, Sigma2) Computes the probability 
%    density function of the examples X under the multivariate gaussian 
%    distribution with parameters mu and Sigma2. If Sigma2 is a matrix, it is
%    treated as the covariance matrix. If Sigma2 is a vector, it is treated
%    as the \sigma^2 values of the variances in each dimension (a diagonal
%    covariance matrix)
% ���ض������˹�ֲ��ĸ����ܶȷֲ���ֵ

% ��������
k = length(mu);

% sigma2 ����������������ʽ��Ҳ����������������ʽ����
if (size(Sigma2, 2) == 1) || (size(Sigma2, 1) == 1)
    % diag() �趨�ԽǾ��󣬽������sigma2��Ϊ�Խ���Ԫ��
    Sigma2 = diag(Sigma2);
end

% X = bsxfun(@minus, X, mu(:)');
% �����mu������һά������������(:)��ʹ�������Ϊ������������ת��
% �����Ͳ��ù�ԭ��������������������
X = X - mu(:)';
% ���Ǹ�����ϵ���������� - ��
% p = (2 * pi) ^ (- k / 2) * det(Sigma2) ^ (-0.5) * ...
%     exp(-0.5 * sum(bsxfun(@times, X * pinv(Sigma2), X), 2));

% ���������ڸ�ʽ֮�У�����sigma2�н����⣬�����Ķ�û�н���������ʹ�ó˷�������ʱ��
% ���ʵ�����Ƕ�Ӧ���
% ���ﲻ̫����
p = (2 * pi) ^ (- k / 2) * det(Sigma2) ^ (-0.5) * ...
    exp(sum((-0.5 * X * pinv(Sigma2)) .* X, 2));

end