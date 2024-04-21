% ENGI 1331H Project2-王宇涵-2220213666
clc,clear,close all
% Section 1
% Task 1.0
% Task 1.1
fc=imread('Bob.jpg');
fc1=imread('Library.jpg');
% Task 1.2
[r,c,d]=size(fc);
[r1,c1,d1]=size(fc1);
disp('The size of fc');
disp(size(fc));
disp('The size of fc1');
disp(size(fc1));
% We can use the size function to know the size of the image clearly so
% that we can do more things such as matting.
% The similarity are that the row number, column number and dimentionals are
% totally the same.
% Task 1.3
rbob=fc(:,:,1);
gbob=fc(:,:,2);
bbob=fc(:,:,3);
mask_white=gbob>250;
maskfc=cat(3,mask_white,mask_white,mask_white);
bob_library=fc;
bob_library(maskfc)=fc1(maskfc);
image(bob_library);

% Section 2
% Task 2.0
% Task 2.1
rlibrary=fc1(:,:,1);
glibrary=fc1(:,:,2);
blibrary=fc1(:,:,3);
rlibrary1=fc1(:,:,1);
glibrary1=fc1(:,:,2);
blibrary1=fc1(:,:,3);
% Task 2.2;
% Black Bob
black_ghost=cat(3,mask_white,mask_white,mask_white);
figure(103);
subplot(2,2,1);
image(black_ghost);
title('3D Mask Visualized');
% Red ghost
ghost_mask=~mask_white;
rlibrary(ghost_mask)=rbob(ghost_mask);
red_ghost=cat(3,rlibrary,glibrary,blibrary);
subplot(2,2,2);
image(red_ghost)
title('UH Campus w/Red Bob Ghost');
% Green ghost
ghost_mask=~mask_white;
glibrary(ghost_mask)=gbob(ghost_mask);
green_ghost=cat(3,rlibrary1,glibrary,blibrary1);
subplot(2,2,3);
image(green_ghost);
title('UH Campus w/Green Bob Ghost');
% Blue ghost
ghost_mask=~mask_white;
blibrary(ghost_mask)=bbob(ghost_mask);
blue_ghost=cat(3,rlibrary1,glibrary1,blibrary);
subplot(2,2,4);
image(blue_ghost);
title('UH Campus w/Blue Bob Ghost');


% Section 3
% Task 3.0
% Task 3.1
fc2=imread('Rainbow.jpg');
figure(301);
image(fc2);
% Task 3.2
[r2,c2,d2]=size(fc2);
disp('The size of fc2');
disp(size(fc2));
% Task 3.3
rrainbow=fc2(:,:,1);
grainbow=fc2(:,:,2);
brainbow=fc2(:,:,3);
% Task 3.4
figure(304);
subplot(2,2,1);
image(fc2);
colorbar
subplot(2,2,2);
image(rrainbow);
colorbar
subplot(2,2,3);
image(grainbow);
colorbar
subplot(2,2,4);
image(brainbow);
colorbar
% Task 3.5
L1=length(rrainbow);
L2=length(grainbow);
L3=length(brainbow);
a=zeros(3,3,3);
a(1,:,1)=L1;
a(1,:,2)=L2;
a(1,:,3)=L3;
disp(a);
% Task 3.6
x=input('A number within the range of RGB values');
R1=abs(rrainbow-x);
G1=abs(grainbow-x);
B1=abs(brainbow-x);
figure(306);
fc22(:,:,1)=R1;
fc22(:,:,2)=G1;
fc22(:,:,3)=B1;
subplot(3,3,9);
image(fc22);
title('subtracted value');
R2=rrainbow+x;
G2=grainbow+x;
B2=brainbow+x;
fc222(:,:,1)=R2;
fc222(:,:,2)=G2;
fc222(:,:,3)=B2;
subplot(3,3,5);
image(fc222);
title('added value');
subplot(3,3,1);
image(fc2);
title('oringinal image');
% Task 3.7
R3=rrainbow+255;
G3=grainbow+255;
B3=brainbow+255;
fc13(:,:,1)=R3;
fc13(:,:,2)=G3;
fc13(:,:,3)=B3;
mask_rb=rrainbow>80&grainbow>20&brainbow>99;
mask_rainbow=cat(3,mask_rb,mask_rb,mask_rb);
fc2(mask_rainbow)=fc13(mask_rainbow);
figure(307);
image(fc2);



