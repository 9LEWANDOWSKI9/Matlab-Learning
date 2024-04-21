
function[deflection]=CalcDeflection(x,F,a,E,vector)
L=vector(1);
w=vector(2);
h=vector(3);
% Use the complict equations to calculate the deflection
I=w*h^3/12;
R=F*(L-a)/L;
r=F*a*(2*L-a)*(L-a)/(6*E*I*L);
if x<=a
 deflection=-r*x+R*x^3/(6*E*I);
else
    deflection=-r*x+R*x^3/(6*E*I)-F*(x-a)^3/(6*E*I);
end