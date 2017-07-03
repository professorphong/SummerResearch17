function S = checksum(A,B)
S = sum(sum(abs(A-B)));
end