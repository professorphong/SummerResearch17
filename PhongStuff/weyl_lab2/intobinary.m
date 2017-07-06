function v = intobinary(p,m)
lmax = floor(log2(p));
v = zeros(m,1);
for l = m-1:-1:0
if (p>=2^l && p<2^(l+1))
v(m-l,1) = 1;
p = p - 2^l;
end
end


