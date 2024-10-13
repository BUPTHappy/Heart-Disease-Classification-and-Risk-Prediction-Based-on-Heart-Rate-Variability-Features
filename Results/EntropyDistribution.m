clc;
clear all;

% 读取第一个文本文档的数据
data1 = load('nsrd_fuz_result.txt');

% 读取第二个文本文档的数据
data2 = load('chf_fuz_result.txt');

% 创建第一个子画布并绘制第一个箱线图
subplot(1, 2, 1);
boxplot(data1);
xlabel('Data');
ylabel('Values');
title('Boxplot for NSRD');

% 创建第二个子画布并绘制第二个箱线图
subplot(1, 2, 2);
boxplot(data2);
xlabel('Data');
ylabel('Values');
title('Boxplot for CHF');
