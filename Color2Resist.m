function[resist]=Color2Resist(colors,ColorCode,Multiplier)
% we use the strcmp function to find the positions of colors
x=find(strcmp(ColorCode,colors(1))==1)-1;
y=find(strcmp(ColorCode,colors(2))==1)-1;
z=find(strcmp(Multiplier,colors(3))==1)-1;
digit=10.^z;
resist=(10.*x+y).*digit;
end