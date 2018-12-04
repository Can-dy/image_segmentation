
%%%%%%%%%%%%%%%%%%%%%%%%简单阈值法的图像分割%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all;close all;
I=imread('saturn.png');        %读入图像
I=rgb2gray(I);                 %彩色图像转换为灰度图像
Th=128;
[H,W]=size(I);
for h=1:H
    for w=1:W
        if (I(h,w)>Th)
            BW(h,w)=255;
        else 
            BW(h,w)=0;
        end
    end
end
   subplot(1,2,1);
   imshow(I),title('原始图像');
   subplot(1,2,2);
  imshow(uint8(BW)),title('阈值分割结果');
   
    
