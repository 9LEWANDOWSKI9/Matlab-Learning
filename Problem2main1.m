% ENGI 1331H Project4-王宇涵-2220213666
% Task 1
clc,clear,close all 
a=csvread('SeismicData.csv');
[row,col]=size(a);
value=0;
for r=1:row
    for c=1:col
        while a(r,c) <= 0
          question=sprintf('Replace the nagetive value at (%0.0f,%0.0f):',r,c);
          newa=input(question);
          a(r,c)=newa;
           if a(r,c) > 0
             value=value+1;
           end
        end
    end
end
fprintf('There were %d values changed from negative/zero to positive\n',value);

% Task 2
location=[];
d=input('Enter a velocity limit between 13500 and 15000 [m/s]: ');
while d < 13500 || d > 15000
    d=input('Enter a velocity limit between 13500 and 15000 [m/s]: ');
end
p=1;
for r1=1:row
    for c1=1:col
        while a(r1,c1) > d
            a(r1,c1)=d;
            p=p+1;
            location=[location;[r1,c1]];
        end
    end
end

fprintf('There were %d values over the velocity limit\n',p);
csvwrite('SeismicData_changes.csv',a);
% Task 3
k=0;

for j=1:col
    for z=1:row
        for i=1:row-1
            if a(i,j) > a(i+1,j)
                k=a(i,j);
                a(i,j)=a(i+1,j);
                a(i+1,j)=k;
            end
        end
    end
end

% Task 4
% vn=(v-vmin)/(vmax-vmin)


normalize=[];
repeat=1;
while repeat==1
    u=input('Which location"s data would you like to normalize?');
    fprintf('Original\tNormalized\n');
    for v=1:row
        normalize(v)=(a(v,u)-a(1,u))/(a(row,u)-a(1,u));
       
        fprintf('%5d%13.4f\n',a(v,u),normalize(v));
    end
    repeat=menu('Would you like to normalize another column?','Yes','NO');
end

% Task 6
subplot(2,1,1);
x1=a(1:row,u);
y1=normalize(1,1:end);
plot(x1,y1,'r');

title('');
xlabel('The measurement number');
ylabel('The normalized velocities');
hold on
grid on

subplot(2,1,2);
x2=a(1:row,u);
y2=normalize(1,1:end);
plot(y2,x2,'r');
title('');
xlabel('The measurement number');
ylabel('The normalized velocities');
hold on
grid on

   
    









