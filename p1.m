% 王宇涵2220213666P2
clc, clear,close all
NBR=load('numbers.txt');
A=sum(NBR);
disp('The sum of all values');
disp(A);
B=find(NBR>60);
C=find(NBR<7);
NBR1=NBR;
NBR1(B)=44;
NBR1(C)=44;
BB=length(B);
CC=length(C);
DD=BB+CC;
disp('The total values that are replaced');
disp(DD);
K=sum(NBR1);
disp('The sum of values of new NBR');
disp(K);
