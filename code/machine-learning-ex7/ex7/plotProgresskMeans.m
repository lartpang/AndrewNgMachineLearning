function plotProgresskMeans(X, centroids, previous, idx, K, i)
%PLOTPROGRESSKMEANS is a helper function that displays the progress of 
%k-Means as it is running. It is intended for use only with 2D data.
%   PLOTPROGRESSKMEANS(X, centroids, previous, idx, K, i) plots the data
%   points with colors assigned to each centroid. With the previous
%   centroids, it also plots a line between the previous locations and
%   current locations of the centroids.
% �������й���

% Plot the examples
% ��ͬ�������Ʋ�ͬ��ɫ
plotDataPoints(X, idx, K);

% Plot the centroids as black x's
% Marker - ��Ƿ���
% 'none' ��Ĭ�ϣ� | 'o' | '+' | '*' | '.' | ...
% MarkerIndices - Ҫ��ʾ��ǵ����ݵ������
% 1:length(YData) ��Ĭ�ϣ� | ���������� | ����������
% MarkerSize - ��Ǵ�С
% 6 ��Ĭ�ϣ� | ��ֵ
% MarkerEdgeColor - ���������ɫ
% 'auto' ��Ĭ�ϣ� | RGB ��Ԫ�� | 'r' | 'g' | 'b' | ...
% MarkerFaceColor - ��������ɫ
% 'none' ��Ĭ�ϣ� | 'auto' | RGB ��Ԫ�� | 'r' | 'g' | 'b' | ...
plot(centroids(:,1), centroids(:,2), 'x', ...
     'MarkerEdgeColor','k', ...
     'MarkerSize', 10, 'LineWidth', 3);

% Plot the history of the centroids with lines
for j = 1 : size(centroids, 1)
    % ���µ����ĵ���ɵ�����
    drawLine(centroids(j, :), previous(j, :));
end

% Title
title(sprintf('Iteration number %d', i))

end

