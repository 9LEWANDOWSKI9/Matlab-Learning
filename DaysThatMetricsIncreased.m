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
[rlayer,glayer,blayer]=SL(fc);
[maskfc]=MM(rlayer,glayer,blayer,255,250,255);
[bob_library]=AM(fc,fc1,maskfc);
figure(31);
image(bob_library);