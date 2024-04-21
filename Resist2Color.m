function[colorbands]=Resist2Color(ohms,ColorCode,Multiplier)
colorbands(1)=ColorCode(ohms(1)+1);
colorbands(2)=ColorCode(ohms(2)+1);
k=length(ohms(3:end));
colorbands(3)=Multiplier(k+1);
end