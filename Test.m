img = imread('C:\Users\boshe\Desktop\Top\2.jpg');
img = imcrop(img,[400,300,300,300]);
img_half_circle = ~im2bw(img,0.94); %%0.98 whole circle
img_whole_circle = ~im2bw(img,0.97);

SE = strel('disk',1);
img_hcir = imclose(img_half_circle,SE);
img_hcir = imopen(img_hcir,SE);

img_wcir = imclose(img_whole_circle,SE);
img_wcir = imopen(img_wcir,SE);

stat1 = regionprops(img_wcir,'basic');
centroid1 = cat(1,stat1.Centroid);
Particle_Position = cat(1,stat1.Area);
Position = find(Particle_Position==max(Particle_Position));
BoundingBox = cat(1,stat1.BoundingBox);
ROI_StartPoint_X = BoundingBox(Position,1);
ROI_StartPoint_Y = BoundingBox(Position,2);

subplot(121)
imshow(img_hcir)
%%hold on
%%rectangle('Position',[X,Y,stat2.BoundingBox(3),stat2.BoundingBox(4)],'EdgeColor','r','LineWidth',0.75,'LineStyle','--')

stat2 = regionprops(img_hcir,'basic');
centroid2 = cat(1,stat2.Centroid);
X = stat2.BoundingBox(1);
Y = stat2.BoundingBox(2);

subplot(122)
imshow(img_wcir)
%%hold on 
%%rectangle('Position',[ROI_StartPoint_X,ROI_StartPoint_Y,BoundingBox(Position,3),BoundingBox(Position,4)],'EdgeColor','r','LineWidth',0.75,'LineStyle','--')
%%hold on 
%%plot(centroid1(1),centroid1(2),'*');
%%hold on


%%plot(centroid2(1),centroid2(2),'*');
possible_angle = (360*atan((centroid2(2)-centroid1(2))/(centroid2(1)-centroid1(1)))/(2*pi));




 
  




