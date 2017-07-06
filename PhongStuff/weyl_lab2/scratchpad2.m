%New scratchwork for just scratching
%I want to create a vector of all the base 2 values from 0 to 16 as a
%string.
m=4
binvalues=[]
for i=0:15
    binvalues=[binvalues; num2str(dec2bin(i,m))]
end


for i=0:2:15
    i
end