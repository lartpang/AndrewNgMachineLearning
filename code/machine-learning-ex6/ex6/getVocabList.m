function vocabList = getVocabList()
%GETVOCABLIST reads the fixed vocabulary list in vocab.txt and returns a
%cell array of the words
%   vocabList = GETVOCABLIST() reads the fixed vocabulary list in vocab.txt 
%   and returns a cell array of the words in vocabList.


% Read the fixed vocabulary list
fid = fopen('vocab.txt');

% Store all dictionary words in cell array vocab{}
n = 1899;  % Total number of words in the dictionary

% For ease of implementation, we use a struct to map the strings => integers
% In practice, you'll want to use some form of hashmap
vocabList = cell(n, 1);
for i = 1 : n
    % A = fscanf(fileID,formatSpec,sizeA) 将文件数据读取到维度为 sizeA 的数组 A 
    % 中，并将文件指针定位到最后读取的值之后。fscanf 按列顺序填充 A。sizeA 
    % 必须为正整数或采用 [m n] 的形式，其中 m 和 n 为正整数。
    
    % Word Index (can ignore since it will be = i)
    fscanf(fid, '%d', 1);
    % Actual Word
    vocabList{i} = fscanf(fid, '%s', 1);
end
fclose(fid);

end
