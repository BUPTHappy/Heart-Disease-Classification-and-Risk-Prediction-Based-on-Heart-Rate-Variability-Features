clc;
clear;
close all;
tic;
% 指定文件夹路径
folder_path = 'D:\刘卓尔\北京邮电大学\毕业设计\数据集\MIT-BIT nard_Dataset\500个样本划分';

% 获取文件夹中所有的 txt 文件
file_list = dir(fullfile(folder_path, '*.txt'));

% 初始化一个空矩阵用于存储计算的值
chf_sEn_matrix = [];

%% 主函数

% 遍历每个 txt 文件
for i = 1:length(file_list)
    % 获取当前文件名
    filename = fullfile(folder_path, file_list(i).name);
    X=load(filename);
    X=X';   % 将信号y的各个分量转置
    
    % 计算样本熵
    dim=2;
    r=0.2*std(X);
    sampEn = SampleEntropy(dim, r, X);
    chf_sEn_matrix=[chf_sEn_matrix; sampEn];
end
% 输出结果矩阵
output_filename = 'nsrd_sEn_result.txt';
dlmwrite(output_filename, chf_sEn_matrix, 'delimiter', '\t');
