function checkCostFunction(lambda)
%CHECKCOSTFUNCTION Creates a collaborative filering problem 
%to check your cost function and gradients
%   CHECKCOSTFUNCTION(lambda) Creates a collaborative filering problem 
%   to check your cost function and gradients, it will output the 
%   analytical gradients produced by your code and the numerical gradients 
%   (computed using computeNumericalGradient). These two gradient 
%   computations should result in very similar values.
% 用随机的数据来求出对应的数值梯度和求导的梯度，进而进行比较

% Set lambda
if ~exist('lambda', 'var') || isempty(lambda)
    lambda = 0;
end

%% Create small problem
X_t = rand(4, 3);
Theta_t = rand(5, 3);

% Zap out most entries
Y = X_t * Theta_t';
Y(rand(size(Y)) > 0.5) = 0;
R = zeros(size(Y));
R(Y ~= 0) = 1;

%% Run Gradient Checking
X = randn(size(X_t));
Theta = randn(size(Theta_t));
num_users = size(Y, 2);
num_movies = size(Y, 1);
num_features = size(Theta_t, 2);

% 对于现有的[X(:); Theta(:)]进行各项上微调，所有的电影特征元素和用户参数元素
% 求出微调后的数值梯度汇总的向量，和各电影各用户相对应
numgrad = computeNumericalGradient( ...
                @(t) cofiCostFunc(t, Y, R, num_users, num_movies, ...
                                num_features, lambda), [X(:); Theta(:)]);

[~, grad] = cofiCostFunc([X(:); Theta(:)],  Y, R, num_users, ...
                          num_movies, num_features, lambda);

disp([numgrad grad]);
fprintf(['The above two columns you get should be very similar.\n' ...
         '(Left-Your Numerical Gradient, Right-Analytical Gradient)\n\n']);

diff = norm(numgrad-grad)/norm(numgrad+grad);
fprintf(['If your cost function implementation is correct, then \n' ...
         'the relative difference will be small (less than 1e-9). \n' ...
         '\nRelative Difference: %g\n'], diff);

end