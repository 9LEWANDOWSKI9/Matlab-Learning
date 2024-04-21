% ENGI 1331H Project2-王宇涵-2220213666
clc,clear,close all
load('MaterialElasticity.mat');
s=menu('Select a material',Material);
E=Elasticity(s);
v=input('Enter the length, width and height of the beam as a 1*3 vector:');
F=input('Enter the magnitude of a concentrated force acting on the beam:');
a=input('Enter the location of the force(0-10.00meters):');
i=0;
for x=0:0.1:v(1)
    i=i+1;
   [deflection]=CalcDeflection(x,F,a,E,v); 
   X(i)=x;
   deflection1(i)=deflection*1000;
end
plot(X,deflection1,'-');
xlim([0,v(1)]);
xlabel('Beam Location (x) [m]');
ylabel('Deflection of Beam (y) [mm]');
title('Deflection of Steel Beam Under a Concentrated Load')
grid on

% Task 2
F1=input('Enter the magnitude of multiple loads on the beam [N]:');
a1=input('Enter the locations of the forces, in order (0-10.00meters):');
deflection11=zeros(length(a1),v(1));
for n=1:length(a1)
    A=a1(n);
    F11=F1(n);
    k=0;
    for x=0:0.1:v(1)
        k=k+1;
        [deflection13]=CalcDeflection(x,F11,A,E,v);
        deflection11(n,k)=deflection13*1000;
    end
end
 Totalvalue=sum(deflection11);
 Totalvaluemax=min(Totalvalue);
 TTT=abs(Totalvaluemax);
 fprintf('The maxmimum deflection of the beam is %0.3f [mm]',TTT);
 plot(X,Totalvalue,'-');
xlim([0,v(1)]);
xlabel('Beam Location (x) [m]');
ylabel('Deflection of Beam (y) [mm]');
title('Deflection of Steel Beam Under a Concentrated Load')
grid on
        
        
        