function visualizeBoundaryLinear(X, y, model)
%VISUALIZEBOUNDARYLINEAR plots a linear decision boundary learned by the
%SVM
%   VISUALIZEBOUNDARYLINEAR(X, y, model) plots a linear decision boundary 
%   learned by the SVM and overlays the data on it

w = model.w;
b = model.b;
xp = linspace(min(X(:, 1)), max(X(:, 1)), 100);
% 注意，实际上决策边界是 0 = b + w(1) * xp  + w(2)* yp => yp == xp2 ; 
% 可以这样理解么？
yp = - (w(1) * xp + b) / w(2);

plotData(X, y);
hold on;
plot(xp, yp, '-b'); 
hold off

end
