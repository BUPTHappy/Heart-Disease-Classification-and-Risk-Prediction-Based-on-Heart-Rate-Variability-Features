clc;
clear all;
%% 主函数调用排列熵函数求时间序列的排列熵值
% 指定文件夹路径
folder_path = 'D:\刘卓尔\北京邮电大学\毕业设计\数据集\CHF_Dataset\500个样本划分';

% 获取文件夹中所有的 txt 文件
file_list = dir(fullfile(folder_path, '*.txt'));

% 初始化一个空矩阵用于存储计算的值
chf_pe_matrix = [];

% 遍历每个 txt 文件
for i = 1:length(file_list)
    % 获取当前文件名
    filename = fullfile(folder_path, file_list(i).name);
    X=load(filename);
    X=X';
    [m,n]=size(X);  % X为时间序列,一行为一个时间序列。
    % 求排列熵:pe为排列熵
    M = 3;  % 嵌入维数
    T = 2;  % 延迟时间
    pe=zeros(1,m);
    for j=1:m
    [pe(j),~] = PermutationEntropy(X(j,:),M,T);
    end
    % 将计算得到的值存入结果矩阵中
    chf_pe_matrix = [chf_pe_matrix; pe];
end
% 输出结果矩阵
output_filename = 'chf_pe_result.txt';
dlmwrite(output_filename, chf_pe_matrix, 'delimiter', '\t');

