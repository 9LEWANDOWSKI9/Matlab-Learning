function[out]=Evensub_2220213666(in)
x=length(in);
for n=2:2:x
    in(n)=in(n)-in(n-1);
end
out=in;