
%%%%%%%%%%%%%%%%%%%%%%%%����ֵ����ͼ��ָ�%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all;close all;
I=imread('saturn.png');        %����ͼ��
I=rgb2gray(I);                 %��ɫͼ��ת��Ϊ�Ҷ�ͼ��
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
   imshow(I),title('ԭʼͼ��');
   subplot(1,2,2);
  imshow(uint8(BW)),title('��ֵ�ָ���');
   
    
