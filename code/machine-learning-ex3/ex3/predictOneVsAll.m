function pro_classes = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  pro_classes = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
pro_classes = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1), X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%       

% x * all_theta' : 5000 * 10
% all_theta 这个量，一行代表一类的训练出来的特征向量所以，使用时要注意转置
% sigmoid(X * all_theta') 计算结果是矩阵，每一个行值是每个样本多种分类情况下的预测值，每一列对应一种分类
% [value, index] =max(A, [], 2)，沿着维度 dim 返回最大元素。例如，如果 A 为矩阵，则 max(A,[],2)
% 是包含每一行的最大值的列向量。dim=1时，则返回每一列的最大值。所以这里max返回的是值和索引（即预测分类）的组合。
[value, pro_classes] = max(sigmoid(X * all_theta'), [], 2);

% =========================================================================

end
