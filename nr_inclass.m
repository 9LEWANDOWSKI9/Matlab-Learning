% Find roots of x³-5x²+6x-80 = 0
clear all; clc; close all;
% define polynomial
c = [1 -5 +6 -80];%[3 -10 6]
cd= polyder(c);
% f(x) = 0, x= ?
target = 0;
x0   = 10;% initial guess
err  = abs(polyval(c,x0) - target); % err of x0
iter = 0;% count iteration number
N    = [];
X_0  = [];
X_1  = [];
E_p  = [];
while err > 1e-2 && iter < 10
     iter = iter +1;
     N    = [N; iter];
     X_0  = [X_0; x0];
     % apply Newton-Raphson method  x(n+1)=x(n)-f(x(n))/f'(x(n));
     x1   = x0 - polyval(c,x0)/polyval(cd,x0);
     X_1  = [X_1; x1];
%      figure(1); subplot(1,2,1); hold on;
%      plot(iter,x1,'x');
     
     err  = abs(polyval(c,x1) - target);
     err_p= abs((x1-x0)/x0);
     E_p  = [E_p; err_p];
%      figure(1); subplot(1,2,2); hold on;
%      plot(iter,err,'o');
     % update
     x0   = x1;
%      keyboard
end
%%
figure; plot(N,X_1);xlabel('iteration #');ylabel('x value');
figure; plot(N,E_p);xlabel('iteration #');ylabel('percent error');

x0

roots(c)