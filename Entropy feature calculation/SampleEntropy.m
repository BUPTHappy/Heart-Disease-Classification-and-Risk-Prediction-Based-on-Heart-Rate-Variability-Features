%% 样本熵函数
function sampEn = SampleEntropy( dim, r, data, tau )
if nargin < 4, tau = 1; end
if tau > 1, data = downsample(data, tau); end
N = length(data);
result = zeros(1,2);
for m = dim:dim+1
    Bi = zeros(N-m+1,1);
    dataMat = zeros(N-m+1,m);
    
    % 设置数据矩阵，构造成m维的矢量
    for i = 1:N-m+1
        dataMat(i,:) = data(1,i:i+m-1);
    end
    % 利用距离计算相似模式数
    for j = 1:N-m+1
        % 计算切比雪夫距离，不包括自匹配情况
        dist = max(abs(dataMat - repmat(dataMat(j,:),N-m+1,1)),[],2);
        % 统计dist小于等于r的数目
        D = (dist <= r);
        % 不包括自匹配情况
        Bi(j,1) = (sum(D)-1)/(N-m);
    end
 
    % 求所有Bi的均值
    result(m-dim+1) = sum(Bi)/(N-m+1);
	
end
    % 计算得到的样本熵值
    sampEn = -log(result(2)/result(1));
	
end
