

function [ PSNR,MSE ] = homework1( input_args )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
 
listing = dir('F:\course of 3\����ͼ����\��ҵ1\��Ƭ\*.jpg'); 
sum=zeros(720,1280,3);
for i = 1:24

    imgName = listing(i).name; 

    imgData = imread(imgName); 

    % ���� 
    fprintf(' %s\n',imgName);% ��ʾ���ڴ����ͼ���� 
   % subplot(5,5,i);
   % imshow(imgData);
   imgData= double( imgData);
        sum=sum+imgData;
end
sum=sum/24;
sum=uint8(sum);
imshow(sum);
    imgName = listing(1).name; 

    imgData1 = imread(imgName); 
        imgName = listing(2).name; 

    imgData2 = imread(imgName); 
[PSNR,MSE]=Psnr(sum,imgData1);
%print('%f  %f',PSNR,MSE);

function [ PSNR,MSE ] = Psnr( im1,im2 )
%UNTITLED5 �˴���ʾ�йش˺�����ժҪ
%   �����ֵ����ȳ���
% im1:the original image matrix
%im2:the modified image matrix
if (size(im1))~=(size(im2))
    error('������ͼ���С��һ��');
end

[m,n]=size(im1);
A=double(im1);
B=double(im2);
D=sum(sum((A-B).^2));
MSE = D/(m*n);
if D==0
       PSNR=200;
    error('����ͼһ��');
else
    PSNR = 10*log10 ((255^2)/MSE);
end


