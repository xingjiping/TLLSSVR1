%原始1440分钟数据经滑动窗口转为训练样本
step=1;
window=12;%  W为22日
x=w1;%%%%%%%%%%%%%%%%%%%%%%%%
y=data;%%%%%%%%%%%%%%%%%%%%
data(:,1:9)=x;
data(:,10)=y(:,2);

[m n]=size(y);
for i=1:step:m-window+1
    sum=0;
    for j=1:window
        sum=sum+data(i+j-1,2);
    end
    window_sum2(i)=sum;  
end

for i=1:step:m-window+1
    sum=0;
    for j=1:window
        sum=sum+data(i+j-1,3);
    end
    window_sum3(i)=sum;  
end

for i=1:step:m-window+1
    sum=0;
    for j=1:window
        sum=sum+data(i+j-1,4);
    end
    window_sum4(i)=sum;  
end

for i=1:step:m-window+1
    sum=0;
    for j=1:window
        sum=sum+data(i+j-1,5);
    end
    window_sum5(i)=sum;  
end

for i=1:step:m-window+1
    sum=0;
    for j=1:window
        sum=sum+data(i+j-1,6);
    end
    window_sum6(i)=sum;  
end

for i=1:step:m-window+1
    sum=0;
    for j=1:window
        sum=sum+data(i+j-1,7);
    end
    window_sum7(i)=sum;  
end

for i=1:step:m-window+1
    sum=0;
    for j=1:window
        sum=sum+data(i+j-1,8);
    end
    window_sum8(i)=sum;  
end

for i=1:step:m-window+1
    window_sum9(i)=data(i,9);    
end

for i=1:step:m-window+1
    sum=0;
    for j=1:window
        sum=sum+data(i+j-1,10);
    end
    window_sum10(i)=sum;  
end

for i=1:m-window+1
newdata(i,1)=i;
newdata(i,2)=window_sum2(i);
newdata(i,3)=window_sum3(i);
newdata(i,4)=window_sum4(i);
newdata(i,5)=window_sum5(i);
newdata(i,6)=window_sum6(i);
newdata(i,7)=window_sum7(i);
newdata(i,8)=window_sum8(i);
newdata(i,9)=window_sum9(i);
newdata(i,10)=window_sum10(i);
end

D64_6104_19=newdata;%Changing number
save D64_6104_19.mat D64_6104_19%Changing number