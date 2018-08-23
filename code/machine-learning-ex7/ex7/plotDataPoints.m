function plotDataPoints(X, idx, K)
%PLOTDATAPOINTS plots data points in X, coloring them so that those with the same
%index assignments in idx have the same color
%   PLOTDATAPOINTS(X, idx, K) plots data points in X, coloring them so that those 
%   with the same index assignments in idx have the same color
% 绘点，上色，同一个簇的，同一种颜色

% Create palette
% 返回包含 m 种颜色的hsv颜色图。
% 防止K为0？
palette = hsv(K);

% 为不同的样本选择对应的一个hsv颜色图
colors = palette(idx, :);

% Plot the data
% scatter(x,y,sz,c) 
% 指定圆颜色。要以相同的颜色绘制所有圆圈，请将 c 指定为颜色名称或 RGB 三元数。
% 要使用不同的颜色，请将 c 指定为向量或由 RGB 三元数组成的三列矩阵。
% sz 以平方磅为单位的标记面积 x,y 标记位置
scatter(X(:,1), X(:,2), 15, colors);

end
