x=linspace(0,4*pi,100);
y=sin(x);
p=polyfit(x,y,3);
x1=linspace(0,4*pi,100);
y1=polyval(p,x1)
figure(1);
hold on
plot(x,y,'r+');
plot(x1,y1,'bd');
xlabel('x');
ylabel('+actual data and diamond estimated');
title('PG13');
hold off