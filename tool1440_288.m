%1440分钟信令数据转为288个5分钟的记录（待预测数据）
w43=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W43.csv');
w44=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W44.csv');
w45=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W45.csv');
w46=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W46.csv');
w47=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W47.csv');
w48=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W48.csv');
w49=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W49.csv');
w50=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W50.csv');
w51=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20训练数据源/信令/W51.csv');
w52=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W52.csv');
w53=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W53.csv');
w54=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W54.csv');
w55=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W55.csv');
w56=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W56.csv');
w57=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W57.csv');
w58=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W58.csv');
w59=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W59.csv');
w60=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W60.csv');
w61=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W61.csv');
w62=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W62.csv');
w63=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W63.csv');
w65=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W65.csv');
w66=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W66.csv');
w68=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20训练数据源/信令/W68.csv');
w69=csvread('C:/Users/xingjiping-PC/Desktop/day19数据源/day20数据源/day20预测数据源/信令/W69.csv');


a=data;
j=1;
for i=1:5:1440
    p_288(j,1)=j;
    p_288(j,1)=sum(a(i:i+4,1));
     p_288(j,2)=sum(a(i:i+4,1));
    j=j+1;
end
data1=p_288;
save data1.mat data1;



