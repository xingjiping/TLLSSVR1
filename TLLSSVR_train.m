% ********************************************************************
% * Author:LiuYang
% * Date:2016.6.2
% * Version:1.0
% ********************************************************************
clc;
close all;
clear;
load E:/预测数据/day19数据源/test/D94_6804_20.mat;%训练数据，64路段信令数据，6364卡口数据，22日

X1(1:1436,:)=D94_6804_20(:,:);%修改
X1 = X1(:,:);
[N D] =size(X1);
randvector = randperm(N);
X1 = X1(randvector(:),:);
X_trn=X1(1:1436,2:9);
Y_trn=X1(1:1436,10);


X_tst=D94_6804_20(: ,2:9);%修改
[test_len dim]=size(X_tst);
clear extra_options;
extra_options.importance = 1; 
model = regRF_train(X_trn,Y_trn,400,8,extra_options);
Y_pre = regRF_predict(X_tst,model);
Y_pre=Y_pre;
for ii=1:test_len
    x(ii)=ii;
end
  figure,plot(x,Y_pre,'b');
 % legend('预测值',-1);
save MD94_6804_20.mat model;%存模型

