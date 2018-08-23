function drawLine(p1, p2, varargin)
%DRAWLINE Draws a line from point p1 to point p2
%   DRAWLINE(p1, p2) Draws a line from point p1 to point p2 and holds the
%   current figure

% ����varargin��һ���ɱ������ָ������������һ��Ԫ������ 1xn �ģ�����ʵ�ֶ��ڻ�ͼ�����Ľ�һ���趨
plot([p1(1), p2(1)], [p1(2), p2(2)], varargin{:});

end