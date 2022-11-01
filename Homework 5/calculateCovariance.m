% Inputs:
% x: a sample set
% y: a sample set
% Outputs:
% cov: the covariance between the samples

%Linear Regression, hw5 p3
%Function that calculates the covariance between two sample sets
%Duncan Di Mauro
%805163177

function cov = calculateCovariance(x, y)

%Calculating means of sample set
xmean = mean(x);
ymean = mean(y);

%Applying Equation 9 from hw
cov = sum(((x - xmean).*(y - ymean))/length(x)); 
%We could also use length(y), since it is/needs to be the same as length(x)

end