function h = weakclassifier3(fx,polarity,threshold)
%the feature must already be evaluated on x

if fx*polarity < threshold*polarity
    h = 1;
else
    h = 0;
end