% ENGI 1331H Project4-王宇涵-2220213666
clc,clear,close all 
% Task 1
a=imread('MRI_Scan.png'); % Bigger background
b=imread('Tumor.png');
[r1,c1,~]=size(a);
[r2,c2,~]=size(b);

while (r2 > r1) ||( c2 > c1)
    if (r2 > r1) && ( c2 > c1)
        error('There is an error. Elimate the program');
    elseif r2 > r1
         error('There is an error. Elimate the program');
    else
         error('There is an error. Elimate the program');
    end
end
% Task 2
location=[];
tic;
for r=1:r1-r2+1
    for c=1:c1-c2+1
      if a(r,c)==b(1,1)
           found=1;
            
            for rcheck=1:r2
                for ccheck=1:c2
            if b(rcheck,ccheck)~=a(r+rcheck-1,c+ccheck-1)
           found=0;
           
            end
                end
            end
            if found==1
            location=[location;[r,c,r+r2-1,c+c2-1]];
            end
            
      end
    end
end
[number,~]=size(location);
for k=1:number
    fprintf('The tumor is located between the coordinates [%d,%d] and [%d,%d] starting from the top left corner of the MRI scan\n',location(k,1),location(k,2),location(k,3),location(k,4));
end

% Task 3
P1=imread('MRI_Scan.png');
P2=imread('Tumor.png');
%P1_gray=rgb2gray(P1);
%P2_gray=rgb2gray(P2);
  for n1=1:r1
      for n2=1:c1
            P1_gray(n1,n2)=P1(n1,n2,1)*0.2989+P1(n1,n2,2)*0.5870 +P1(n1,n2,3)*0.1140  ;
      end
  end
 
%  P2_gray=rgb2gray(P2); 
%  Li=mean(P2(:))
GEORGE=0;
 for n1=1:r2
      for n2=1:c2
            P2_gray(n1,n2)=P2(n1,n2,1)*0.2989+P2(n1,n2,2)*0.5870 +P2(n1,n2,3)*0.1140;
            GEORGE=double(GEORGE)+double(P2_gray(n1,n2));
      end
  end  
PAUL=GEORGE/(c2*r2);   
    
      
    for n1=location(1):location(3)
        for n2=location(2):location(4)
            if P1_gray(n1,n2)>=PAUL
                P1(n1,n2,1)=255;
                P1(n1,n2,2)=255;
                P1(n1,n2,3)=0;
            end
        end
    end
image(P1)
toc;















