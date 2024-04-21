% find roots of x³-5x²+6x-80=0
clear all; clc; close all;
% define polynomial
c      = [1 -5 6 -80];
c_der  = polyder(c);%take the derivative of polynomial c
% apply Newton-Raphson method  x(n+1)=x(n)-f(x(n))/f'(x(n));
iter= 0;
x0  = 1;   % initial guess: x0
target = 0;% f(x_target)=target, we need roots of f(x), so f(x) = 0 = target

err = 1E-3;% ideal error, which is needed to terminate the iteration
err_current = 1; % dummy value
% err_percent = 1;
while err_current > err % iter < 5
    if iter == 0
    err_current = polyval(c,x0) - target; % error of current guess
    
    % plot the history of x
    figure(1); subplot(1,2,1);hold on;
    plot(iter,x0,'o');xlabel('iteration #');ylabel('x value')
    % plot the history of error
    figure(1); subplot(1,2,2);hold on;
    plot(iter,err_current,'o');xlabel('iteration #');ylabel('err value')
    end
    % count iteration #
    iter = iter+1;
    % plot the history of x    
    x1   = x0 - polyval(c,x0)/polyval(c_der,x0);
    figure(1); subplot(1,2,1);hold on;
    plot(iter,x1,'x');

    err_current = abs(polyval(c,x1) - target); % calculate the error of x1
    % plot the history of error
    figure(1); subplot(1,2,2);hold on;
    plot(iter,err_current,'*')
  
    %keyboard;

%     err_percent = abs((x1 - x0)/x0)
%     figure(2);hold on;
%     plot(iter,err_percent,'x');
    
    % update x0    
    x0   = x1;  
end
x0
x_0 = roots(c)