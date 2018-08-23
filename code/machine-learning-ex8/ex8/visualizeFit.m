function visualizeFit(X, mu, sigma2)
%VISUALIZEFIT Visualize the dataset and its estimated distribution.
%   VISUALIZEFIT(X, p, mu, sigma2) This visualization shows you the 
%   probability density function of the Gaussian distribution. Each example
%   has a location (x1, x2) that depends on its feature values.
% 

% [X,Y] = meshgrid(x) 与 [X,Y] = meshgrid(x,x) 相同，
% 并返回网格大小为 length(x)×length(x) 的方形网格坐标。X代表X轴，Y代表Y轴
[X1, X2] = meshgrid(0 : .5 : 35); 
Z = multivariateGaussian([X1(:), X2(:)], mu, sigma2);
Z = reshape(Z, size(X1));

plot(X(:, 1), X(:, 2), 'bx');
hold on;
% Do not plot if there are infinities
if (sum(isinf(Z)) == 0)
    % 无限值的个数为0，均为有限值
    % contour(X,Y,Z,n) 和 contour(X,Y,Z,v) 使用 X 和 Y 绘制 Z 的等高线图，
    % 以确定 x 和 y 值，n表示等高线数目。v 表示等高线的级数向量
    contour(X1, X2, Z, 10 .^ (-20 : 3 : 0)');
end
hold off;

end