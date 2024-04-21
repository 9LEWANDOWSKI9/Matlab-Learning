clc, clear, close all
disp('王宇涵2220213666');
x=[0:0.1:100];
[bestangle]=U(50,18,x);
[maxbestangle,index]=max(bestangle);
bestx=x(index);
% The two outputs
disp('The largest angle');
disp(maxbestangle);
disp('The best distance from the screen');
disp(bestx);