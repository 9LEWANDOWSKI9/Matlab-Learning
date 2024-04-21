clc
clear all
clear figures
% Practice loading files and determing # 
% of rows and columns

% practice1_01.txt
fc1=load('practice1_01.txt');
[nrow,ncol]=size(fc1)
disp('pause')
pause  % cursor will "blink" simply hit a keyboard key

% practice1_02.txt
fc2=load('practice1_02.txt');
[nrow1,ncol1]=size(fc2)
disp('pause')
pause
fcfile3=input('Enter name of dataset ','s');
% p1_array.txt
fc3=load('p1_array.txt');
[nrow2,ncol2]=size(fc3);

% practice formatting output with fprintf
fprintf('Rows: %d\n', nrow2);
fprintf('Columns: %d\n', ncol2);
disp('pause')
pause

% practice using roots and polyval

% 3x^2 -4x + 2
c1=[3,-4,2];
% x+ 2x^2 -4x^3
c2=[-4,2,1,0];
r1=roots(c1)
r2=roots(c2)

% practice creating a vector [start,interval,end]
x1=[0:0.1:10];
x2=[0:0.1:10];

y1=polyval(c1,x1);
y2=polyval(c2,x2);

% practice plotting
figure(98) % user determines figure #
hold on % hold is used for multiple plots
plot(x1,y1,'md') % majenta diamonds
plot(x2,y2,'r+')  % red plus signs
hold off  % no more plotting on figure 98
disp('pause')
pause
figure(99) % new figure
hold on % multiple plots
plot(x1,cos(x1),'b') % type "help plot" in command
% window for options
plot(x1,sin(x1),'md')
hold off
disp('pause')
pause

% practice input statement
xb=input('create vector and begin with   ')
incr=input('interval please   ')
xend=input('end vector with  ')
x5=[xb:incr:xend]

figure (1020) % notice labels, grid and title
hold on
plot(x5,sin(x5),'r'),xlabel('x'),...
    ylabel('sin(x) and cos(2x)'),grid,...
    title('this is fun')
plot(x5,cos(2*x5),'md')
hold off
figure (1022)
hold on
plot(x5,sin(x5),'r'),xlabel('x'),...
    ylabel('sin(x) and cos(2x)'),grid,...
    title('this is fun')
plot(x5,cos(2*x5),'md')
hold off
disp('pause')
pause

x8=[0:2:24];
x9=[3:2:27];
fprintf('%6.4f\n',x8,x9)


%Collecting quantitative data happens all the time
%in the “real world”. Data, in general, 
%is described as having an independent
%variable (IV) (time, position etc.) and
%a dependent variable (DV) (chemical concentration,
%velocity, pressure etc.).
 
%Engineers and Math folks (EM) like to take
%“real world” Data and fit the data quantitatively
%to an algebraic equation.
 
%polyfit is a builtin function that takes the IV and DV and fits the data to a “nth” order polynomial where “n” is chosen by the EM. The output is a set of coefficients (C) that represent the fitted polynomial.
%C=polyfit(IV,DV,4);
 
 
%polyval takes the C from polyfit and the IV and produces 
%a representation of the actual DV.
 
%rep=polyval(C,IV);




%Use polyfit to fit a nth-degree polynomial to the points.

x = linspace(0,4*pi,100);
y = sin(x);


p = polyfit(x,y,3);% 3 means 3rd order
%Evaluate the polynomial on a finer grid and plot the results.

x1 = linspace(0,4*pi,100);
y1 = polyval(p,x1);
figure(78)
hold on
plot(x,y,'r+')
plot(x1,y1,'bd'),grid,xlabel('x'),...
    ylabel('+ actual data and diamond estimated'),...
    title('using polyfit')
hold off
disp('pause')
pause

%finding peaks in data
x12=[0:0.1:5*pi];
y12=sin(x12);
figure(34)
findpeaks(y12) % finds local peaks n-1<n and n>n=1
disp('pause')
pause
[local_p,index]=findpeaks(y12)
row=ceil(find(A==min(min(A)))/ncol);



