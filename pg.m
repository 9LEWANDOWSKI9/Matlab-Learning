g=input('Gravity Constant');
h0=input('Initial Height');
v0=input('Initial Velocity');
starttime=input('Time to Start');
endtime=input('End Time');
% h(t)=h0+v0*t-0.5*g*t^2
t=[starttime:0.01:endtime];  % just creat values for t
h=h0+(v0.*t)-(0.5.*g.*(t.^2)); 
[maxh,index]=max(h)
disp('Fucking...Fucking and Fucking');
pause(2)
disp('Maximum Height')
disp(maxh)
disp('Time that Maximum Height occured')
disp(t(index))
pause(2)
disp('Ready to plot results')
figure(13)
hold on 
plot(t,h,'g')
xlabel('Time (t) in seconds')
ylabel('Height (h) in feet')
title('PG13')
plot(t(index),h(index),'ro')
hold off