clc;
clear;
close all;
tic;

% 指定文件夹路径
folder_path = 'D:\刘卓尔\北京邮电大学\毕业设计\数据集\CHF_Dataset\500个样本划分';

% 获取文件夹中所有的 txt 文件
file_list = dir(fullfile(folder_path, '*.txt'));

% 初始化一个空矩阵用于存储计算的值
chf_fuz_matrix = [];
%% 主函数调用模糊熵函数求时间序列的模糊熵值
% 遍历每个 txt 文件
for i = 1:length(file_list)
    % 获取当前文件名
    filename = fullfile(folder_path, file_list(i).name);
    X=load(filename);
    X=X';   % 将信号y的各个分量转置
    [m,n]=size(X);
    r0=0.15;   % r为相似容限度
    Out_FuzEn=zeros(1,m);
    for j=1:m
        r=r0*std(X(j,:));
       FuzEn(j) = FuzzyEntropy(X(j,:),2,r,2,1);
    end
    chf_fuz_matrix=[chf_fuz_matrix; FuzEn];
end
% 输出结果矩阵
output_filename = 'chf_fuz_result.txt';
dlmwrite(output_filename, chf_fuz_matrix, 'delimiter', '\t');
 
