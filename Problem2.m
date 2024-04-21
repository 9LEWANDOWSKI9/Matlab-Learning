clc;
clear;
close all;
fprintf('ENGI 1331H Project 4 - Li Yuanqing - 2220211629\n');
%%
%Task 1
Data = csvread('SeismicData.csv');
[DR,DC] = size(Data);
ValueChange = 0;
for i = 1 : 1 : DR
    for j = 1 : 1 : DC
        while (Data(i,j) <= 0)
            Reput = sprintf('Please enter a positive value at (%d,%d):',i,j);
            Data(i,j) = input(Reput);
            if Data(i,j) > 0
                ValueChange = ValueChange + 1;
            end
        end
    end
end
fprintf('\nThere were %d values changed fro, negative/zero to positive.\n\n',ValueChange);
%%
%Task 2
MaxSeismic = 0;
Changes = 0;
while (MaxSeismic < 13500 || MaxSeismic > 15000)
    MaxSeismic = input('Enter a velocity limit between 13,500 and 15,000 [m/s]:');
end
for i = 1 : 1 : DR
    for j = 1 : 1 : DC
        if Data(i,j) > MaxSeismic
            Changes = Changes + 1;
            SC(Changes,1) = i;
            SC(Changes,2) = j;
            Data(i,j) = MaxSeismic;
        end
    end
end
fprintf('There were %d values over the velocity limit.\n\n',Changes);
csvwrite('SeismicData_changes.csv',SC);
%%
%Task 3
Swap = 0;
for i = 1 : 1 : DC
    for z=1: 1:  DR
        for j = 1 : 1 : DR
            if j ~= DR
                if (Data(j,i) > Data(j+1,i))
                    Swap = Data(j,i);
                    Data(j,i) = Data(j+1,i);
                    Data(j+1,i) = Swap;
                end
            end
        end
    end
end
%%
%Task 4&5
repeat = 0;
while repeat ~= 2
    column = input('Which location''s data would you like to normalize?');
    while (column<0 || column>DC)
        column = input('Which location''s data would you like to normalize?');
    end
    fprintf('Original\tNormalized\n');
    Normalized = zeros(1,DR);
    for i = 1 : 1 : DR
        Normalized(i) = (Data(i,column)-Data(1,column))/(Data(DR,column)-Data(1,column));
        fprintf('%5d%13.4f\n',Data(i,column),Normalized(i));
    end
    repeat = menu('Would you like to normalize another column?','Yes','No');
end
%%
%Task 6
subplot(2,1,1);
for i = 1 : 1 : DR
    plot(Data(i,column),Normalized(i));
    hold on;
end
title('');
xlabel('Measurement');
ylabel('Normalized velocities');

subplot(2,1,2)
for i = 1 : 1 : DR
    plot(Data(i,column),Normalized(i));
    hold on;
end
title('');
xlabel('Measurement');
ylabel('Normalized velocities');
