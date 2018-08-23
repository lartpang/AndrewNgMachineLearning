function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
% 根据现有的各样本的中心点的索引确定的簇，求出并返回新的中心点的位置
% 求出来中心点后，可进一步再次求距离运算，对样本聚类

% Useful variables
[m, n] = size(X);
% m 样本数，n 特征数

% You need to return the following variables correctly.
centroids = zeros(K, n);
% 中心点与原始数据点只是数目不同，特征数目还是一致的

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

% for i = 1 : K
%     % 利用find找到对应于第i个中心点的样本位置——idx_index 样本索引
%     % find(idx == i) 按列搜索元素值为i的元素，返回其总体看做一个列向量时的位置
%     % 直接对列向量操作更为直观 idx mx1
% 	idx_index = find(idx == i);
%     % 该簇内样本数量
% 	ck = size(idx_index, 1);
% 	centroids(i, :) = sum(X(idx_index, :), 1) ./ ck;
% end

for i = 1 : K
    % 直接使用逻辑索引来提高速度
    % 直接对列向量操作更为直观 idx mx1
	idx_index = (idx == i);
    % 同一簇的样本，对各个特征求均值
    % mean和sum的第二个参数指定的是运算的维度，1表示结果是对列的运算，2表示对行求和或者均值
    % 获得新的中心点
	centroids(i, :) = mean(X(idx_index, :), 1);
end

% =============================================================

end

