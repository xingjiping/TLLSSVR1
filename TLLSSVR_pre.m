% ********************************************************************
% * Author:LiuYang
% * Date:2016.6.2
% * Version:1.0
% ********************************************************************
clc;
close all;
clear;
load E:/Ԥ������/day19����Դ/test/MD94_6804_20.mat;%WΪ22�գ�NΪ17��
%C:/Users/xingjiping-PC/Desktop/day19����Դ/20�Ŵ������/M42_6610_20.mat

%����ģ�ͣ�M:model,6:·����,6378:��Ӧ���ڣ�22������
%load w69.mat;%�����������ݣ��޸�

w69=csvread('E:/Ԥ������/day19����Դ/test/W69.csv')
%load W64.mat;%�����������ݣ��޸�

X_tst=w69(: ,2:9);%�޸�



[test_len dim]=size(X_tst);
clear extra_options;
extra_options.importance = 1; 
Y_pre = regRF_predict(X_tst,model);
Y_pre=Y_pre;
for ii=1:test_len
    x(ii)=ii;
end
  figure,plot(x,Y_pre,'b');
  %legend('Ԥ��ֵ',-1);

xlswrite('w69_2.xls',floor(Y_pre));%����Ԥ������
