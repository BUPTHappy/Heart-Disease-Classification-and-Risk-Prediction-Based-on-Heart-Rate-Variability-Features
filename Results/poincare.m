clc;
clear all;

% 假设data是时间序列数据
data=load('D:\刘卓尔\北京邮电大学\毕业设计\数据集\CHF_Dataset\500个样本划分\chf01_group_6.txt');

% 设置参数
window_sizes = [1, 2, 3, 4, 5, 6]; % 不同尺度窗口大小
num_points = length(data); % 数据点个数

% 绘制多尺度庞加莱散点图
for i = 1:length(window_sizes)
    % 初始化子图
    subplot(2, 3, i);
    
    window_size = window_sizes(i);
    local_stds = zeros(1, num_points - window_size);
    for j = 1:(num_points - window_size+1)
        % 计算局部标准差
        local_std = std(data(j:j+window_size-1));
        local_stds(j) = local_std;
    end
    % 绘制散点图
    scatter(local_stds, data(window_sizes(i):end), 'filled');
    
    % 设置子图属性
    xlabel('局部标准差');
    ylabel('时间序列数据');
    title(['尺度 = ', num2str(window_sizes(i))]);
end



