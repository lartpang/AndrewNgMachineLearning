function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
% 寻找最近的中心点，返回的是各样本对应的 1~k中心点 的索引
% idx(1) 表示 X(1, :) 的对应的中心点索引

% Set K 为给定初始化中心点点数
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% for i = 1:size(X,1)
%     idx(i) = 1;
%     for j = 1:K
%         if (sum((X(i,:) - centroids(j,:)) .^ 2) < sum((X(i,:) - centroids(idx(i),:)) .^ 2))
%             idx(i) = j;
%         end
%     end
% end

for i = 1 : size(X, 1)
    idx(i) = 1;
    old_idx_centroids = (X(i, :) - centroids(idx(i), :)) * (X(i, :) - centroids(idx(i), :))';
    % 计算样本Xi的最近中心点
    for j = 1 : K
        % 如果此刻的中心点计算距离小于原先的，就更新中心点，不小的话就没必要再如上那样计算旧距离
        % 注意((X(i, :) - centroids(j, :))为行向量，想要表示累加，需要对第二个进行转置
        if (((X(i, :) - centroids(j, :)) * (X(i, :) - centroids(j, :))') < old_idx_centroids)
            idx(i) = j;
            old_idx_centroids = (X(i, :) - centroids(idx(i), :)) * (X(i, :) - centroids(idx(i), :))';
        end
    end
end

% =============================================================

end

