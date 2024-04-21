% Exam 4 - ENGI 1331 
% Name: 王宇涵2220213666

clc; clear; close all;

% Task 1
a=imread('image1.png');
figure(1);
subplot(131);
image(a);


[rowa,cola,~]=size(a);
for r1=1:rowa
    for c1=1:cola
        if a(r1,c1,2) > a(r1,c1,1) && a(r1,c1,2) > a(r1,c1,3)
            a(r1,c1,2)=0;
        end
    end
end
subplot(132);
image(a);

% Task 2
for r2=2:rowa-1
    for c2=2:cola-1
        if a(r2,c2,2) > a(r2,c2,1) || a(r2,c2,2) > a(r2,c2,3)
            a(r2,c2,2)=min([a(r2-1,c2,2),a(r2+1,c2,2),a(r2,c2-1,2),a(r2,c2+1,2)]);
        end
    end
end
subplot(133);
image(a);




% Task 3
% The upper line(power)
load('Exam4.mat');
x1=UpData(:,1);
y1=UpData(:,2);
pm38=polyfit(log10(x1),log10(y1),1);
m1=pm38(1);
b1=10^(pm38(2));
EQm38 = @(x) b1*x.^m1;
% The lower line(exp)
x2=LowData(:,1);
y2=LowData(:,2);
em38=polyfit(x2,log(y2),1);
m2=em38(1);
b2=exp(em38(2));
EQm381 = @(x) b2*exp(m2*x);

figure(2);
hold on
func1=@(x) EQm38(x)-50;
int1=fzero(func1,20);
plot([0,int1],[50,50],'m','linewidth',3);

plot([50,50],[0,EQm381(50)],'m','linewidth',3);

fun2=@(x) EQm38(x) -255;
int2=fzero(fun2,100);
plot([int2,255],[255,255],'m','linewidth',3);

plot([255,255],[EQm381(255),255],'m','linewidth',3);

fplot(EQm381,[50,255],'m','linewidth',3);
fplot(EQm38,[int1,int2],'m','linewidth',3);
xmin=0;
xmax=255;
ymin=0; 
ymax=255;
axis([xmin, xmax, ymin, ymax]);
grid on

% Task 4
% Caculate the area outside the magenta 
s1=(255-50)*int1;
s2=(int2-int1)*(255-50)/2;
s3=integral(EQm381,50,255);
sm38=255*255-s1-s2-s3;
percent=sm38/255*255;
fprintf('The percent of the phase diagram that is magenta is %.2f\n',percent*100);

% Task 5
km38=input('Enter a starting pixel (Top Left for a 20*20 square) :');
fm38=a(km38(1):km38(1)+19,km38(2):km38(2)+19);
subplot(122);
image(fm38);
title('Square image: Starting point km38(1),km38(2)');
[rm38,cm38,~]=size(fm38);
redm38=0;
purplem38=0;
bluem38=0;
subplot(121);
for r4=1:rm38
    for c4=1:cm38
        if ((c4<int1)&&(r4>50)) && (c4>int1&&c4<int2)&&(r4>EQm38(c4))
            plot(c4,r4,'ob');
            bluem38=bluem38+1;
        elseif (c4>50&&c4<255)&&(r4<EQm381(c4))
            plot(c4,r4,'or');
            redm38=redm38+1;
        else
            plot(c4,r4,'om');
            purplem38=purplem38+1;
        end
        string1=sprintf('"Red"      %d',redm38);
        string2=sprintf('"Purple"      %d',purplem38);
        string3=sprintf('"Blue"     %d',bluem38);
        PGm38(1,1:(8+length(redm38)))=string1;
        PGm38(2,1:(8+length(purplem38)))=string2;
        PGm38(3,1:(8+length(bluem38)))=string3;
    end
end

fprintf('Color\tCount\n');
disp(PGm38);








