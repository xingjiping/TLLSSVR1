% ********************************************************************
% * Author:LiuYang
% * Date:2016.6.2
% * Version:1.0
% ********************************************************************
clc;
close all;
clear;
load E:/预测数据/day19数据源/test/MD94_6804_20.mat;%W为22日，N为17日
%C:/Users/xingjiping-PC/Desktop/day19数据源/20号处理程序/M42_6610_20.mat

%载入模型，M:model,6:路段名,6378:对应卡口，22：日期
%load w69.mat;%载入信令数据，修改

w69=csvread('E:/预测数据/day19数据源/test/W69.csv')
%load W64.mat;%载入信令数据，修改

X_tst=w69(: ,2:9);%修改



[test_len dim]=size(X_tst);
clear extra_options;
extra_options.importance = 1; 
Y_pre = regRF_predict(X_tst,model);
Y_pre=Y_pre;
for ii=1:test_len
    x(ii)=ii;
end
  figure,plot(x,Y_pre,'b');
  %legend('预测值',-1);

xlswrite('w69_2.xls',floor(Y_pre));%保存预测数据
