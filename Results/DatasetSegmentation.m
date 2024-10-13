clc;
clear all;
    
% 读取txt文件
data = dlmread('MIT_18.txt');

% 获取数据总长度
total_length = length(data);

% 定义每个组的大小
group_size = 500;

% 计算分组的数量
num_groups = ceil(total_length / group_size);

% 将数据分组并写入新的txt文件
for i = 1:num_groups
    % 计算当前组的起始索引和结束索引
    start_index = (i - 1) * group_size + 1;
    end_index = min(i * group_size, total_length);
    
    % 获取当前组的数据
    current_group = data(start_index:end_index);
    
    % 写入当前组的数据到新的txt文件
     output_folder = 'D:\刘卓尔\北京邮电大学\毕业设计\数据集\MIT-BIT nard_Dataset\500个样本划分';
     filename = sprintf('MIT_18_group_%d.txt', i);
     output_file = fullfile(output_folder,filename);
     dlmwrite(output_file, current_group, 'delimiter', '\t');
end


