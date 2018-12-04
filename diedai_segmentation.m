%%%%%%%%%%%%%%%%%%%%%迭代法%%%%%%%%%%%%%%%%%%%
clc; clear all;close all;                              
I=imread('lena.jpg'); 
Img=rgb2gray(I);
Img_copy=Img;
[x,y]=size(Img);                    
b=double(Img);                   
zd=double(max(max(Img)));                   
zx=double(min(min(Img)));                
T=double((zd+zx))/2;                    

while 1                   % 迭代最佳阈值分割算法 
    S0=0.0; n0=0.0;                   %为计算灰度大于阈值的元素的灰度总值、个数赋值 
    S1=0.0; n1=0.0;                   %为计算灰度小于阈值的元素的灰度总值、个数赋值 
    for i=1:x
        for j=1:y
            if double(Img(i,j))>=T
                S1=S1+double(Img(i,j));  %大于阈域值图像点灰度值累加
                n1=n1+1;                %大于阈域值图像点个数累加
            else 
                S0=S0+double(Img(i,j));  %小于阈域值图像点灰度值累加
                n0=n0+1;                %小于阀域值图像点个数累加
            end 
        end 
    end  
    T0=S0/n0;             %求小于阀域值均值
    T1=S1/n1;             %求大于阀域值均值
    if abs(T-((T0+T1)/2))<0.1     %迭代至 前后两次阀域值相差几乎为0时 停止迭代。
        break;
    else
       T=(T0+T1)/2;                 %在阈值T下，迭代阈值的计算过程 
   end 
end 
T                        %显示最佳阈值
Im=im2bw(Img,T/255);% 图像在最佳阈值下二值化
subplot(1,2,1);imshow(Img_copy),title('灰度图像')
subplot(1,2,2);imshow(Im),title('分割结果')