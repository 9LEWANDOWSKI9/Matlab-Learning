% Exam 3 - ENGI 1331
% Name: 王宇涵
% UHID: 2220213666
% Cougarnet Username:
% Date: 

clc; clear all; close all;

%% Problem 1
r=randi([1,5],[1,3]);
repeat=1;
ALLCODES=[];

while repeat==1
i=1;
a=input('Guess the secret code :');
ee=zeros(1,3);

 
while i < 6
    i=i+1;
    if a(1)==r(1)
    ee(1)=1;
     end
    if a(2)==r(2)
    ee(2)=1;
    
    end
    if a(3)==r(3)
    ee(3)=1;
    
    end
s=sum(ee);
fprintf('You have %d value(s) in the correct position\n',s);
a=input('Guess the secret code :');
if ( a(1)==r(1))&&(a(2)==r(2))&&(a(3)==r(3))
    disp('Congrats You have unlocked the secret door');
if (( a(1)~=r(1))&&(a(2)~=r(2))&&(a(3)~=r(3))) && i==6
    disp('You are out of guesses The secret door will remain locked forever');
end
end
end
ALLCODES=[ALLCODES,a];
repeat=menu('Do you want to repeat the program?','yes','no');


end
writemarix(ALLCODES,'Problem1Result');




%% Problem 2
x=input('Enter a vector with values less than 100 :');
k=1;
[r,c]=size(x);
DATA=[];
while r ~= 1 && k ~=3
    k=k+1;
    warning('You did not enter a vector Try again');
x=input('Enter a vector with values less than 100 :');
end
if k==3 && r ~= 1 
    error('You did not enter a vector The program is terminated');
end
for w=1:c
    if x(w) > 100
        LOC=w;
        fprintf('The value in position %d is %d',w,x(w));
        ii=input('Enter a new value :');
    elseif x(w) < 0
        x(w)=0;
    else 
        [newout]=Evensub_2220213666(x);
    end
end
DATA=[DATA,x];









