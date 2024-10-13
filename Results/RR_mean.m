clc;
clear all;

%%计算时域特征 RR 间期序列的均值
% 指定文件夹路径
folder_path = 'D:\刘卓尔\北京邮电大学\毕业设计\数据集\CHF_Dataset\500个样本划分';

% 获取文件夹中所有的 txt 文件
file_list = dir(fullfile(folder_path, '*.txt'));

% 初始化一个空矩阵用于存储计算的值
nsrd_rr_mean_matrix = [];

for i=1:length(file_list)
    % 读取数据集
    filename = fullfile(folder_path, file_list(i).name);
    X=load(filename);
    % 计算平均值
    average_value = mean(X);
    nsrd_rr_mean_matrix=[nsrd_rr_mean_matrix; average_value];
end

% 输出结果矩阵
output_filename = 'chf_rr_mean.txt';
dlmwrite(output_filename, nsrd_rr_mean_matrix, 'delimiter', '\t');