
clc, clear all
 
 
 
%p3

c3 = [0.74 0.97 1.1 0.86]; % data source
x = [-1:0.1:1]; % sample range for x
y = polyval(c3,x); % sample cubic at x
 
noise=load('noisy.txt');% load noise
nlength=length(noise)
ylength=length(y)
ey = y + noise; % make noisy data
ec = polyfit(x,ey,3);% fit noisy data with cubic


figure(98)
hold on
plot(x,y,'g') %data no noise
plot(x,ey,'r+')%data with noise
fy = polyval(ec,x);
plot(x,fy,'bd')%fitted data with noise
hold off

%RMS error
 
  AD=y;
  FD=fy;
  rms1=(FD-AD).^2;
  rms2=sum(rms1);
  rms3=rms2./length(AD);
  rms4=sqrt(rms3);
  rmsfinal=rms4

% keep all plots in same window % exact polynomial
% noisy data
% sample fitted polynomial
% reconstructed data source