% Inputs:
% x: a sample set
% y: a sample set
% Outputs:
% alpha: optimal alpha value
% beta: optimal beta value

%Linear Regression, hw5 p3
%Function to calculate the alpha and beta that minimize the mean-squared error
%Duncan Di Mauro
%805163177

function [alpha, beta] = linearRegression(x, y)

%Eq 8 from hw
beta = calculateCovariance(x, y)/calculateCovariance(x, x);

%Eq 7 from hw
alpha = mean(y) - beta*mean(x);

end
