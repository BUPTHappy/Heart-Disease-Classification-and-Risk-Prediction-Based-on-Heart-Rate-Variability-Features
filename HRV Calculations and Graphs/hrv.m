clc; clear all;
% 加载信号数据
x=load('D:\刘卓尔\北京邮电大学\毕业设计\数据集\16265m.mat');
y=[x.val];
%找到ECG的峰值部分
[pks,locs] = findpeaks(y,2048, ...
'MinPeakProminence',0.3,'MinPeakHeight',0.2);
% 确定RR间隔
RLocsInterval = diff(locs);
% 计算HRV值
tHRV = locs(2:end);
HRV = 1./RLocsInterval;
% 绘制信号
plot(tHRV,HRV,'LineWidth',4)
xlabel('时间(s)')
ylabel('HRV(Hz)')

% 查找取样间隔
figure
hist(RLocsInterval)
grid
xlabel('采样间隔(s)')
ylabel('RR分布')
% 功率谱密度
figure
plomb(HRV,tHRV,'Pd',[0.95, 0.5])
