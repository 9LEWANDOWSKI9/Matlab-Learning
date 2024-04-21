clc,clear
M=[1,2,3,4;5,6,7,8;9,10,11,12;13,14,15,16];
dlmwrite('M.txt',M)

pause(5)

Mtxt=input('Enter name of dataset ','s')
M=load(Mtxt);
[R,C]=size(M);

E(:,C)=M(:,C)-8;
E(:,C-1)=M(:,C-1)+10;
E(:,C-2)=M(:,C-2).^2;
E(:,C-3)=sqrt(M(:,C-3));

FC=[M;E]
