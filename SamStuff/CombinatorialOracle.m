%% Combinatorial Oracle
%How many Haar features?

%the number of features/locations for a 2 rectangle base feature
tot2block = 0;
for q = 1:24
   for p = 1:12
      tot2block = tot2block + (25 - 2*p)*(25 - q); 
   end
end
tot2block

tot3block = 0;
for q = 1:24
   for p = 1:8
      tot3block = tot3block + (25 - 3*p)*(25 - q); 
   end
end
tot3block

tot4block = 0;
for q = 1:12
   for p = 1:12
      tot4block = tot4block + (25 - 2*p)*(25 - 2*q); 
   end
end
tot4block

total = 2*tot2block + 2*tot3block + tot4block
%% How many iterations of my Adaboost attempt should there be?

tot2block = 0;
for q = 2:10
   for p = 2:10
      tot2block = tot2block + (22 - 2*p)*(24 - q); 
   end
end
tot2block = tot2block*40
%Hi