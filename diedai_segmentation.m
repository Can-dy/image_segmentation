%%%%%%%%%%%%%%%%%%%%%������%%%%%%%%%%%%%%%%%%%
clc; clear all;close all;                              
I=imread('lena.jpg'); 
Img=rgb2gray(I);
Img_copy=Img;
[x,y]=size(Img);                    
b=double(Img);                   
zd=double(max(max(Img)));                   
zx=double(min(min(Img)));                
T=double((zd+zx))/2;                    

while 1                   % ���������ֵ�ָ��㷨 
    S0=0.0; n0=0.0;                   %Ϊ����Ҷȴ�����ֵ��Ԫ�صĻҶ���ֵ��������ֵ 
    S1=0.0; n1=0.0;                   %Ϊ����Ҷ�С����ֵ��Ԫ�صĻҶ���ֵ��������ֵ 
    for i=1:x
        for j=1:y
            if double(Img(i,j))>=T
                S1=S1+double(Img(i,j));  %��������ֵͼ���Ҷ�ֵ�ۼ�
                n1=n1+1;                %��������ֵͼ�������ۼ�
            else 
                S0=S0+double(Img(i,j));  %С������ֵͼ���Ҷ�ֵ�ۼ�
                n0=n0+1;                %С�ڷ���ֵͼ�������ۼ�
            end 
        end 
    end  
    T0=S0/n0;             %��С�ڷ���ֵ��ֵ
    T1=S1/n1;             %����ڷ���ֵ��ֵ
    if abs(T-((T0+T1)/2))<0.1     %������ ǰ�����η���ֵ����Ϊ0ʱ ֹͣ������
        break;
    else
       T=(T0+T1)/2;                 %����ֵT�£�������ֵ�ļ������ 
   end 
end 
T                        %��ʾ�����ֵ
Im=im2bw(Img,T/255);% ͼ���������ֵ�¶�ֵ��
subplot(1,2,1);imshow(Img_copy),title('�Ҷ�ͼ��')
subplot(1,2,2);imshow(Im),title('�ָ���')