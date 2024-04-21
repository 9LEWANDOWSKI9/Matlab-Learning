function[bestangle]=U(sceenheight,heightabove,distance)
A=distance./sqrt(sceenheight^2+distance.^2);
B=sceenheight.*A;
C=sqrt(heightabove^2+distance.^2);
D=B./C;
bestangle=asind(D);
end
