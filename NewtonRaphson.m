function[Roots,iterations]=NewtonRaphson(coefficents,startingvalue,desiredpercenterror)
iterations=1;
i=polyder(coefficents);
while desiredpercenterror>=0.1 && desiredpercenterror<=10
    iterations=iterations+1;
    desiredpercenterror=abs((polyval(coefficents,startingvalue)-startingvalue)/startingvalue)*100;
    Roots=roots(coefficents);
end
if i==0
    error('There is an error. Terminate the program');
end