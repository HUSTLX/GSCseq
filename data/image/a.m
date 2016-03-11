clear;clc;close all;
I=imread('149.bmp');
% figure('NumberTitle', 'off', 'Name', 'Ô­Í¼');
subplot(3,3,1)
imshow(I)
gray_I=rgb2gray(I);
% figure('NumberTitle', 'off', 'Name', '»Ò¶ÈÍ¼');
subplot(3,3,2)
imshow(gray_I)
hist_I=histeq(gray_I);
subplot(3,3,3)
imshow(hist_I)
% med_I = medfilt2(gray_I,[3,3],'zeros');
% % figure('NumberTitle', 'off', 'Name', 'ÖÐÖµÂË²¨Í¼');
% subplot(3,3,3)
% imshow(med_I)
I_edge=edge(hist_I,'sobel');
% figure('NumberTitle', 'off', 'Name', 'canny±ßÔµÍ¼');
subplot(3,3,4)
imshow(I_edge);