function plotDecisionBoundary(theta, X, y)
%PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
%the decision boundary defined by theta
%   PLOTDECISIONBOUNDARY(theta, X, y) plots the data points with + for the 
%   positive examples and o for the negative examples. X is assumed to be 
%   a either 
%   1) Mx3 matrix, where the first column is an all-ones column for the 
%      intercept.
%   2) MxN, N>3 matrix, where the first column is all-ones

% Plot Data
plotData(X(:, 2:3), y);
hold on

if size(X, 2) <= 3 % 小于等于3列
    % Only need 2 points to define a line, so choose two endpoints
    % 向x(2)范围外扩张2，并不影响划线，只是让其更加明显。
    plot_x = [min(X(:, 2)) - 2,  max(X(:, 2)) + 2]; 

    % Calculate the decision boundary line
    % 逻辑回归决策边界为 theta'x = 0 也就是这里的 theta(1)+theta(2)x(2)+theta(3)x(3)=0 
    % 而这里的y轴实际上就是x(3)轴
    plot_y = (-1 ./ theta(3)) .* (theta(2) .* plot_x + theta(1));

    % Plot, and adjust axes for better viewing
    plot(plot_x, plot_y)
    
    % Legend, specific for the exercise
    legend('Admitted', 'Not admitted', 'Decision Boundary')
    axis([30, 100, 30, 100])
else
    % Here is the grid range
    u = linspace(-1, 1.5, 50);
    v = linspace(-1, 1.5, 50);

    z = zeros(length(u), length(v));
    % Evaluate z = theta*x over the grid
    for i = 1 : length(u)
        for j = 1 : length(v)
            z(i, j) = mapFeature(u(i), v(j)) * theta;
        end
    end
    z = z'; % important to transpose z before calling contour

    % Plot z = 0
    % Notice you need to specify the range [0, 0]
    contour(u, v, z, [0, 0], 'LineWidth', 2)
end
hold off

end
