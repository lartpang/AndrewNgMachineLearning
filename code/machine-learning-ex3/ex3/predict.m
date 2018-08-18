function probability = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
probability = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

%The matrix X contains the examples in rows , add the column of 1 to the
%matrix. 所以与theta进行乘法运算的时候，对theta进行转置，使得输出结果是一个矩阵，
%每一行为对应为每个样本的结果，行中，各值为对应不同下层单元的输入
z1 = [ones(size(X,1), 1), X] * Theta1';
a2 = sigmoid(z1);
z2 = [ones(size(a2,1), 1), a2] * Theta2';
a3 = sigmoid(z2);

[valus, probability] = max(a3, [], 2);

% =========================================================================

end
