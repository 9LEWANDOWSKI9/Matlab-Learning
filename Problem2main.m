% ENGI 1331H Project2-王宇涵-2220213666
clc,clear,close all
repeat=1;
Roots1=[];
iter1=[];
while repeat==1
num=input('Enter a vector of coefficents for an odd-order polynomial:');
c=1;
L=length(num);
while (mod(L,2)==1) && c~=5 % Because the number of elements should be odd)
    c=c+1;
    num=input('Enter a vector of coefficents for an odd-order polynomial:');
end
if c==5 && (mod(L,2)==1)
    warning('Odd number of coefficents entered. Last element of user input removed');
% Remove the last value of the vector
num(L)=[];
fprintf('The final vector after removing the last element is %d%d%d%d%d',num);
end


% Task 2
% This task is to determine the derivative of T(V0)
% The equcation is Vn=V(n-1)-T(V0)/T'(V0)
% The derivative of the num is 
numd=polyder(num);
k=1;
a=roots(numd);
ROOT=input('Enter an initial guess for the Newton-Raphsono method:');


   while ROOT==a
   
    if k~=3
    k=k+1;
    ROOT=input('Enter an initial guess for the Newton-Raphsono method:');
    else
     error('Initial guess causes a divide by 0 error. Exiting program');    
    end
    end



percenterror=input('Enter the percent difference to compute to [0.1%-10%]:');

[Roots,iter]=NewtonRaphson(num,ROOT,percenterror);
RR=find(Roots>0);
RRR=Roots(RR);
fprintf('The volume at T=0 for the given equation is %f.[m^3]\n',RRR);

fprintf('The solution converged in %d interations\n',iter);
% Task 4 Repeat and store the data
repeat=menu('Repeat the Newton-Raphson calculation?','Yes','No');
while repeat==0
    repeat=menu('Repeat the Newton-Raphson calculation?','Yes','No');
end
Roots1=[Roots1,Roots];
iter1=[iter1,iter];
end
save('Problem2_Results.mat','Roots1','iter1')





    









