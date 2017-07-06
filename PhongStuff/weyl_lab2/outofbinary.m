function m = outofbinary(v)
m = 0;
mult = 1;
for l = length(v):-1:1
m = m + v(l)*mult;
mult = mult*2;
end
