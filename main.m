function main(filename)
% img=imread('data/cows.jpg');
% labels=imread('data/savedLabels/cows-labels.png');
% for img_num=118:517
clc;
% url=strcat('data/image/',num2str(img_num),'.bmp');        
% img=imread(url);
 img=imread(filename);
img=imresize(img,[50,100]);
img2=img;
whole=imread('data/savedLabels/whole.png');
wheels=imread('data/savedLabels/wheels.png');
% Make segmentation options
segH1=seg(img,whole);
for ii=20:80
    sum(ii)=0;
    for jj=15:35
         sum(ii)=double(img(jj,ii,1))+double(img(jj,ii,2))+double(img(jj,ii,3))+sum(ii);
    end
end

min=sum(20);
min_num=80;
for ii=20:80
    if(sum(ii)<min)
        min=sum(ii);
        min_num=ii;
    end
end
 disp(min_num)       
for ii=2:50-1
    for jj=2:100-1
        if ((segH1.seg(ii,jj)==0)&&(segH1.seg(ii,jj+1)==255))||((segH1.seg(ii,jj)==0)&&(segH1.seg(ii,jj-1)==255)||(segH1.seg(ii,jj)==0)&&(segH1.seg(ii+1,jj)==255))||((segH1.seg(ii,jj)==0)&&(segH1.seg(ii-1,jj)==255))
            img(ii,jj,1)=255;
            img(ii,jj,2)=0;
            img(ii,jj,3)=0;
        end
    end
end
 
for ii=25:50
    if((img(ii,min_num,1)==255)&&(img(ii,min_num,2)==0)&&(img(ii,min_num,3)==0))
        break;
    else
        img(ii,min_num,1)=0;
        img(ii,min_num,2)=255;
        img(ii,min_num,3)=0;
    end
end
for ii=25:-1:0
    if((img(ii,min_num,1)==255)&&(img(ii,min_num,2)==0)&&(img(ii,min_num,3)==0))
        break;
    else
        img(ii,min_num,1)=0;
        img(ii,min_num,2)=255;
        img(ii,min_num,3)=0;
    end
end
% figure
% imshow(img)   
imwrite(img,'./first.bmp');   
for ii=1:50
    for jj=1:100
        if segH1.seg(ii,jj)==255
            if min_num<50
                if jj<min_num
                    img(ii,jj,1)=0;
                    img(ii,jj,2)=255;
                    img(ii,jj,3)=0;
                else
                    img(ii,jj,1)=0;
                    img(ii,jj,2)=0;
                    img(ii,jj,3)=255;
                end
            else
                if jj<min_num
                    img(ii,jj,1)=0;
                    img(ii,jj,2)=0;
                    img(ii,jj,3)=255;
                else
                    img(ii,jj,1)=0;
                    img(ii,jj,2)=255;
                    img(ii,jj,3)=0;
                end
            end
        end
    end
end
% figure
% imshow(img)
segH2=seg(img2,wheels);
for ii=1:50
    for jj=1:100
        if segH2.seg(ii,jj)==255
            img(ii,jj,1)=255;
            img(ii,jj,2)=0;
            img(ii,jj,3)=0;
        end
    end
end
% figure
% imshow(img)
imwrite(img,'./second.bmp');   
% save=strcat('data/done1/',num2str(img_num),'.bmp');   
% imwrite(img,save)
% end
