clc;
clear;
close all;
fprintf('ENGI 1331H Project 4 - Li Yuanqing - 2220211629\n');
%%
tic;
%Task 1
MRI = imread('MRI_Scan.png');
Tumor = imread('Tumor.png');
[MR,MC,MD] = size(MRI);
[TR,TC,TD] = size(Tumor);
RM = MRI(:,:,1);
GM = MRI(:,:,2);
BM = MRI(:,:,3);
RT = Tumor(:,:,1);
GT = Tumor(:,:,2);
BT = Tumor(:,:,3);
Check = 0;
if (MR>TR && MC>TC)
    Check = 1;
end
if (MD == 3 && TD == 3)
    Check = 1;
end
if (Check == 0)
    error('Both of the condition is not satisfied');
end
%%
%Task 2
Row = 0;
Column = 0;
a = 0;
b = 0;
Red = zeros(TR,TC);
Green = zeros(TR,TC);
Blue = zeros(TR,TC);
for i = 1 : 1 : MR-TR
    for j = 1 : 1 : MC-TC
        if (RM(i,j) == RT(1,1) & GM(i,j) == GT(1,1) & BM(i,j) == BT(1,1))
            for a = i : 1 : i+TR-1
                for b = j : 1 :j+TC-1
                    Red(a-i+1,b-j+1) =RM(a,b);
                    Green(a-i+1,b-j+1) =GM(a,b);
                    Blue(a-i+1,b-j+1) =BM(a,b);
                end
            end
            %if (RM(i:i+TR-1,j:j+TC-1)==RT & GM(i:i+TR-1,j:j+TC-1)==GT & BM(i:i+TR-1,j:j+TC-1)==BT)
            if (Red == RT & Green == GT & Blue == BT)
                Row = i;
                Column = j;
            end
        end
    end
end
if(Row == 0 && Column == 0)
    fprintf('The tumor cannot be found on this MRI scan.');
else
    fprintf('The tumor is located between the coordinates [%d %d]\nand [%d %d] starting from the top left corner of the MRI scan\n',Row,Column,Row+TR-1,Column+TC-1);
end
%%
%Task 3
for i = Row : 1 : Row+TR
    for j = Column : 1 : Column+TC
        if GM(i,j) > 200
            GM(i,j) = 250;
        end
        if RM(i,j) > 200
            RM(i,j) = 255;
        end
        if BM(i,j) > 120
            BM(i,j) = 100;
        end
    end
end
Final(:,:,1) = RM;
Final(:,:,2) = GM;
Final(:,:,3) = BM;
image(Final);
fprintf('The total time is: %0.3fs',toc);