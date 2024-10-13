clc;
clear all;
%% 计算RR间隔数据的频域特征（快速傅里叶变换）

% 指定文件夹路径
folder_path = 'D:\刘卓尔\北京邮电大学\毕业设计\数据集\MIT-BIT nard_Dataset\500个样本划分';

% 获取文件夹中所有的 txt 文件
file_list = dir(fullfile(folder_path, '*.txt'));

% 初始化一个空矩阵用于存储计算的值
nsrd_rr_LF_matrix = [];

for i=1:length(file_list)
    % 计算FFT
    % 读取数据集
    filename = fullfile(folder_path, file_list(i).name);
    X=load(filename);
    fft_data = fft(X);

    % 计算频率轴
    n = length(X);
    fs = 1; % 采样频率（假设单位为1）
    frequencies = (0:n-1) * fs / n;

    % 计算幅度谱和相位谱
    amplitude_spectrum = abs(fft_data);
    phase_spectrum = angle(fft_data);
    
    % 指定频率范围
    frequency_range = [0, 0.015]; % Hz

    % 找到频率范围对应的索引
    index_range = find(frequencies >= frequency_range(1) & frequencies <= frequency_range(2));

    % 提取幅度值
    amplitudes_in_range = amplitude_spectrum(index_range);

    % 计算平均值
    average_amplitude = mean(amplitudes_in_range);
    disp(['频率范围为', num2str(frequency_range(1)), '到', num2str(frequency_range(2)), 'Hz之间的幅度值平均值为: ', num2str(average_amplitude)]);
    nsrd_rr_LF_matrix=[nsrd_rr_LF_matrix,average_amplitude];
end

nsrd_rr_LF_matrix=nsrd_rr_LF_matrix';
% 输出结果矩阵
output_filename = 'nsrd_rr_LF.txt';
dlmwrite(output_filename, nsrd_rr_LF_matrix, 'delimiter', '\t');

