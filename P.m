g=input('Gravity Constant');
h0=input('Initial Height');
v0=input('Initial Velocity');
starttime=input('Time to Start');
endtime=input('End Time');
% h(t)=h0+v0*t-0.5*g*t^2
t=[starttime:0.01:endtime];
h=h0+(v0.*t)-(0.5.*g.*(t.^2));
[maxh,index]=max(h);
disp(maxh)
disp(t(index))

figure(13)
hold on
plot(t,h,'g')
xlabel('Time(t) in seconds')
ylabel('Height(h) in feet')
title('Path of Ball')
plot(t(index),h(index),'ro')
hold off