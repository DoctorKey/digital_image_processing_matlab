

function [ PSNR,MSE ] = homework1( input_args )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
 
listing = dir('F:\course of 3\数字图像处理\作业1\照片\*.jpg'); 
sum=zeros(720,1280,3);
for i = 1:24

    imgName = listing(i).name; 

    imgData = imread(imgName); 

    % 处理 
    fprintf(' %s\n',imgName);% 显示正在处理的图像名 
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
%UNTITLED5 此处显示有关此函数的摘要
%   计算峰值信噪比程序
% im1:the original image matrix
%im2:the modified image matrix
if (size(im1))~=(size(im2))
    error('两输入图像大小不一致');
end

[m,n]=size(im1);
A=double(im1);
B=double(im2);
D=sum(sum((A-B).^2));
MSE = D/(m*n);
if D==0
       PSNR=200;
    error('两幅图一样');
else
    PSNR = 10*log10 ((255^2)/MSE);
end


