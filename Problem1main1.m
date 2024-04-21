% ENGI 1331H Project4-王宇涵-2220213666
% Task 1
clc,clear,close all 
t=input('Enter a critical temperature of the mixture [K]: ');
while t > 350 || t< 300
    t=input('Enter a critical temperature of the mixture [K]: ');
end
% Task 2
a0=csvread('Boundaries.csv');
[row,col]=size(a0);
P1X=[a0(1,1),a0(1,2),a0(1,3)];
P1Y=[a0(2,1),a0(2,2),a0(2,3)];
PCOEF1=polyfit(log10(P1X),log10(P1Y),1);
%y=b*x^m
m1=PCOEF1(1);
b1=10^PCOEF1(2);
powerFUNC1=@(x)b1*x.^m1;
E1X=[a0(3,1),a0(3,2),a0(3,3)];
E1Y=[a0(4,1),a0(4,2),22.5];
ECOEF1=polyfit(E1X,log(E1Y),1);
%y=b*e^(m*x)
m2=ECOEF1(1);
b2=exp(ECOEF1(2));
expFUNC1=@(x)b2*exp(m2*x);
[xInter1]=IntersectPoint(powerFUNC1,expFUNC1);
yInter1=powerFUNC1(xInter1);
L1X=[150,xInter1];
L1Y=[0,yInter1];
LCOEF1=polyfit(L1X,L1Y,1);
m3=LCOEF1(1);
b3=LCOEF1(2);
linearFUNC1=@(x)m3*x+b3;
y0=expFUNC1(t);
xmin=150;
xmax=350;
ymin=0;
ymax=60;
figure(101);
fplot(powerFUNC1,[xInter1,xmax],'b-','Linewidth',3);
title('Phase Diagram of Unknown Mixture'),grid on,xlabel('Temperature(T)[K]'),ylabel('Pressure(P)[atm]');
axis([xmin,xmax,ymin,ymax]);
hold on
fplot(expFUNC1,[xInter1,t],'b-','Linewidth',3);
fplot(linearFUNC1,[150,xInter1],'b-','Linewidth',3);
line([t t],[y0,60],'linestyle','-','Color','b','LineWidth',3);
text(175,40,'Soild');
text(275,10,'Gas');
text(275,40,'Liquid');

% Task 3
repeat=1;
aaaa=1;
while repeat==1
v=input('Enter a test point on the phase diagram [T,P] :');
while v(1) < 150 || v(1) > 350 || v(2) < 0 || v(2) > 60
    v=input('Enter a test point on the phase diagram [T,P] :');
end
aaaa=aaaa+1;
[p]=CheckPhase_cougarnetID(powerFUNC1,expFUNC1,linearFUNC1,v,xInter1,t);
fprintf('The point (%0.0f,%0.0f) is in the %s  phase\n',v(1),v(2),p);
string=sprintf('     %d              %d         %s ',v(1),v(2),p);
PG(aaaa,(1:(34+length(p))))=string;
repeat=menu('Do you want to enter another point on the phase diagram ?','Yes','No');
end
% Task 5
disp('Temperature[K]  Pressure[atm]  State ');
disp(PG);



% Task 6
A1=integral(linearFUNC1,150,xInter1)+integral(expFUNC1,xInter1,t)+(350-t)*60;
percent=(A1/((350-150)*60));
fprintf('The gas phase is %4.2f%% of the phase diagram.\n',100*percent);



function [xinter1]=IntersectPoint(func1,func2)
diff1=@(t)func1(t)-func2(t);
xinter1=fzero(diff1,[150 350]);
end














