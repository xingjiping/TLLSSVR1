%1440������������תΪ288��5���ӵļ�¼����Ԥ�����ݣ�
w43=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W43.csv');
w44=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W44.csv');
w45=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W45.csv');
w46=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W46.csv');
w47=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W47.csv');
w48=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W48.csv');
w49=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W49.csv');
w50=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W50.csv');
w51=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20ѵ������Դ/����/W51.csv');
w52=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W52.csv');
w53=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W53.csv');
w54=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W54.csv');
w55=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W55.csv');
w56=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W56.csv');
w57=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W57.csv');
w58=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W58.csv');
w59=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W59.csv');
w60=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W60.csv');
w61=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W61.csv');
w62=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W62.csv');
w63=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W63.csv');
w65=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W65.csv');
w66=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W66.csv');
w68=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20ѵ������Դ/����/W68.csv');
w69=csvread('C:/Users/xingjiping-PC/Desktop/day19����Դ/day20����Դ/day20Ԥ������Դ/����/W69.csv');


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



