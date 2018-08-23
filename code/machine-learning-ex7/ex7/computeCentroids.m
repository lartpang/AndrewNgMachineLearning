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
% �������еĸ����������ĵ������ȷ���Ĵأ�����������µ����ĵ��λ��
% ��������ĵ�󣬿ɽ�һ���ٴ���������㣬����������

% Useful variables
[m, n] = size(X);
% m ��������n ������

% You need to return the following variables correctly.
centroids = zeros(K, n);
% ���ĵ���ԭʼ���ݵ�ֻ����Ŀ��ͬ��������Ŀ����һ�µ�

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

% for i = 1 : K
%     % ����find�ҵ���Ӧ�ڵ�i�����ĵ������λ�á���idx_index ��������
%     % find(idx == i) ��������Ԫ��ֵΪi��Ԫ�أ����������忴��һ��������ʱ��λ��
%     % ֱ�Ӷ�������������Ϊֱ�� idx mx1
% 	idx_index = find(idx == i);
%     % �ô�����������
% 	ck = size(idx_index, 1);
% 	centroids(i, :) = sum(X(idx_index, :), 1) ./ ck;
% end

for i = 1 : K
    % ֱ��ʹ���߼�����������ٶ�
    % ֱ�Ӷ�������������Ϊֱ�� idx mx1
	idx_index = (idx == i);
    % ͬһ�ص��������Ը����������ֵ
    % mean��sum�ĵڶ�������ָ�����������ά�ȣ�1��ʾ����Ƕ��е����㣬2��ʾ������ͻ��߾�ֵ
    % ����µ����ĵ�
	centroids(i, :) = mean(X(idx_index, :), 1);
end

% =============================================================

end

