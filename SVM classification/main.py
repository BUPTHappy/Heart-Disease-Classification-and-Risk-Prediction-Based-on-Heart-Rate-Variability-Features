import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score,confusion_matrix
import matplotlib.pyplot as plt
import seaborn as sns

# 读取本地数据集
data = np.genfromtxt('D:\刘卓尔\北京邮电大学\毕业设计\代码\svm分类\FeatureSet_signed.txt')  # 替换 'your_dataset.csv' 为你的数据集文件路径

# 提取特征和标签
X = data[:, :-1]  # 提取除最后一列外的所有列作为特征
y = data[:, -1]   # 提取最后一列作为标签

# 将数据集划分为训练集和测试集
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.5, random_state=41)

# 初始化 SVM 分类器
classifier = SVC(kernel='poly', degree=9, C=0.6, gamma='scale')


# 训练分类器
classifier.fit(X_train, y_train)

# 使用训练好的分类器进行预测
y_pred = classifier.predict(X_test)

# 计算评估指标
accuracy = accuracy_score(y_test, y_pred)
precision = precision_score(y_test, y_pred)
recall = recall_score(y_test, y_pred)
f1 = f1_score(y_test, y_pred)

# 打印评估指标
print("Accuracy:", accuracy)
print("Precision:", precision)
print("Recall:", recall)
print("F1 Score:", f1)


# 计算混淆矩阵
conf_matrix = confusion_matrix(y_test, y_pred)

# 可视化混淆矩阵
plt.figure(figsize=(8, 6))
sns.heatmap(conf_matrix, annot=True, cmap='Blues', fmt='g', cbar=False)
plt.title('Confusion Matrix')
plt.xlabel('Predicted Labels')
plt.ylabel('True Labels')
plt.show()
