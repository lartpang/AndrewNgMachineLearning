function drawLine(p1, p2, varargin)
%DRAWLINE Draws a line from point p1 to point p2
%   DRAWLINE(p1, p2) Draws a line from point p1 to point p2 and holds the
%   current figure

% 最后的varargin是一个可变参数的指定，它本身是一个元胞数组 1xn 的，可以实现对于绘图参数的进一步设定
plot([p1(1), p2(1)], [p1(2), p2(2)], varargin{:});

end