function plotProgresskMeans(X, centroids, previous, idx, K, i)
%PLOTPROGRESSKMEANS is a helper function that displays the progress of 
%k-Means as it is running. It is intended for use only with 2D data.
%   PLOTPROGRESSKMEANS(X, centroids, previous, idx, K, i) plots the data
%   points with colors assigned to each centroid. With the previous
%   centroids, it also plots a line between the previous locations and
%   current locations of the centroids.
% 绘制运行过程

% Plot the examples
% 不同样本绘制不同颜色
plotDataPoints(X, idx, K);

% Plot the centroids as black x's
% Marker - 标记符号
% 'none' （默认） | 'o' | '+' | '*' | '.' | ...
% MarkerIndices - 要显示标记的数据点的索引
% 1:length(YData) （默认） | 正整数向量 | 正整数标量
% MarkerSize - 标记大小
% 6 （默认） | 正值
% MarkerEdgeColor - 标记轮廓颜色
% 'auto' （默认） | RGB 三元数 | 'r' | 'g' | 'b' | ...
% MarkerFaceColor - 标记填充颜色
% 'none' （默认） | 'auto' | RGB 三元数 | 'r' | 'g' | 'b' | ...
plot(centroids(:,1), centroids(:,2), 'x', ...
     'MarkerEdgeColor','k', ...
     'MarkerSize', 10, 'LineWidth', 3);

% Plot the history of the centroids with lines
for j = 1 : size(centroids, 1)
    % 将新的中心点与旧的相连
    drawLine(centroids(j, :), previous(j, :));
end

% Title
title(sprintf('Iteration number %d', i))

end

