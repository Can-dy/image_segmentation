%%%%%%%%%%%%%%%���%%%%%%%%%%%%%%%%%%%%%%
clc; clear all;close all;
I=imread('lena.jpg');
Img=rgb2gray(I);
figure,imshow(I);
figure,imshow(Img);
[H,W]=size(Img);
N=H*W;
L=256;
for i=1:L
    count(i)=sum(sum(Img==i));
    p(i)=count(i)/N;
end

s=1;
for i=1:L   
    if count(i)~=0          %���Ҷȼ�i��Ӧ�����ظ�����Ϊ0��i��ӽ�����st
        st(s)=i;         %st��һ�����飬��i��ӽ�����st
        s=s+1;
    end   
end  

M=numel(st);       %MΪst���鳤�ȣ�����ͼ���д��ڵĻҶȼ��ĸ���
for t=1:256;
    
   U0=0;%��Ҷ�ƽ��ֵ
   for i=1:t
    U0=U0+i*p(i);
   end

   U1=0;   
   for i=t+1:M-1
    U1=U1+i*p(i);
   end

  W0=0;
  for i=1:t
    W0=W0+p(i);
  end

  W1=0;
  for i=t+1:M-1
    W1=W1+p(i);
  end
 g(t)=W0*W1*(U0-U1)^2;
 
end

%m=find(g(t)==max(g(t)));
%for t=1:256;
[h,m]=max(g);
%end
Th=m;
for i=1:H                               %������ֵ��ͼ��ֲ�.......................
    for j=1:W
        if Img(i,j)>Th
            Img(i,j)=256;
        else
            Img(i,j)=1;
        end
    end
end
   
figure,imshow(Img);
