function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network

% 将nn_params的前(hidden_layer_size * (input_layer_size + 1))个参数重新组合成一个
% (hidden_layer_size X (input_layer_size + 1))的矩阵，这里不可以直接指定，
% 不然对于小规模的就不适用了
Theta1 = reshape(nn_params(1 : (hidden_layer_size * (input_layer_size + 1))), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))) : end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables，样本数量
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0; % 前向传播得到的损失函数
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%


%% Initialize the y matrix
% 输出用的yNum，样本数为行数，类别为列数
yNum = zeros(m, num_labels);
for i = 1 : m
  yNum(i, y(i)) = 1;
end

%% 前向传播
% Begin training
a1 = X;

% theta 本是 (下一层单元数X(上一层单元数+1)) 规模的
z2 = [ones(m, 1), a1] * Theta1';
a2 = sigmoid(z2);
% 输出5000*25

z3 = [ones(m, 1), a2] * Theta2';
a3 = sigmoid(z3);
% 输出5000*10

% for i = 1 : m
%   J = J + (-yNum(i, :) * log(a3(i, :))' - (1 - yNum(i, :)) * log(1 - a3(i, :))');
% end
% J = J / m;

% yNum的一行代表该样本下的实际分类情况
% a3的一行代表该样本下的预测情况
% 所以yNum与a3的行有明显的对应关系，不可以直接矩阵相乘，会导致行之间有错乱，
% 正确的结果应该是对矩阵结果求迹
J_pre = trace(-yNum * log(a3)' - (1 - yNum) * log(1 - a3)');
J = J_pre / m;

% Regularization, except for the 1st item (bias unit)，正则化不考虑偏差单元

t1 = Theta1(:, 2 : end);
t2 = Theta2(:, 2 : end);

% 这里的正则化部分，实际上直接对所有的需求的theta进行求和即可，
% 注意这里的Theta1&2都已经是符合实际数据的theta值了，见开头
regularization = lambda / (2 * m) * (sum(sum(t1 .^ 2)) + sum(sum(t2 .^ 2)));

J = J + regularization;

%%  backpropagation 后向传播

% theta 每一行表示这一层所有单元对于下一层某一单元的作用权重
% a3的一行代表该样本下的预测情况，所以d3的一行表示该样本下的误差情况
delta_3 = a3 - yNum;
% 输出5000 x 10
delta_2 = (delta_3 * Theta2(:, 2 : end)) .* sigmoidGradient(z2);
% 输出5000 x 25

% 10 x 26 Theta2_grad
a2_with_a2_0 = [ones(m, 1), a2];
Theta2_grad = delta_3' * a2_with_a2_0 / m;
regularization = lambda / m * [zeros(size(Theta2, 1), 1), Theta2(:, 2:end)];
Theta2_grad = Theta2_grad + regularization;

% 25 x 401 Theta1_grad
a1_with_a1_0 = [ones(m, 1), a1];
Theta1_grad = delta_2' * a1_with_a1_0 / m;
regularization = lambda / m * [zeros(size(Theta1, 1), 1), Theta1(:, 2:end)];
Theta1_grad = Theta1_grad + regularization;

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients，串联矩阵，得到的结果是一个列向量
grad = [Theta1_grad(:); 
        Theta2_grad(:)];

end
