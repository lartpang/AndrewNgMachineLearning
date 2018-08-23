function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

% You should return this values correctly
centroids = zeros(K, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should set centroids to randomly chosen examples from
%               the dataset X
%

% Initialize the centroids to be random examples 

% Randomly reorder the indices of examples 
% p = randperm(n) 返回行向量，其中包含从 1 到 n（包括二者）之间的整数随机置换
% 打乱样本点的顺序，进而实现随机选择点
randidx = randperm(size(X, 1)); 
% Take the first K examples as centroids
% 从样本中随机选择K个作为样本中心点
centroids = X(randidx(1 : K), :);

% =============================================================

end

