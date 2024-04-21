% ENGI 1331H Project2-王宇涵-2220213666
clc, clear, close all
% Loading in the file that can help us convert the color band or resistance
load('ColorGuide.mat');
% Task 1 Main Script
a=menu('Is your input a resistance or a set of color bands?','Resistance','Color Bands');

if a==0
    error('you did not select a value and the program will be terminated');
end
 if a==1
     r=input('Enter the resistance in ohms as a vector:');
  if r(3:end)==zeros(1,length(r(3:end)))
    color=Resist2Color(r,ColorCode,Multiplier);
 fprintf('The color bands for that resistance are %s %s %s',color);
  else
      error('Invalid resistance entered Program terminated');
  end
 end
 if a==2
     c=input('Enter the color bands as a string array of 3 colors:');
     resist=Color2Resist(c,ColorCode,Multiplier);
     fprintf('The resistance for the given color bands is %d Ω',resist);
 end