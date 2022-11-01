%Implementing Custom Probability Distributions hw6 p1
%Approximating a probability density function using randomness
%Duncan Di Mauro
%805163177

clc; close all; clear all

% MATH AND INTEGRAL CALCULATIONS SHOWN BELOW

% p(x) = 0.5*x + 0.5 if x is within [-1, 1], otherwise p(x) = 0
% integral = 0.25*x^2 + 0.5*x 

% P(x) = ((0.25*x^2 + 0.5*x) - (0.25*(-infinity)^2 + 0.5*(-infinity)))
% Ignore when x is not within [-1, 1]
% Now P(x) = ((0.25*x^2 + 0.5*x) - (0.25*(-1)^2 + 0.5*(-1)))

% So P(x) = (0.25*x^2 + 0.5*x + 0.25) when x is within [-1, 1]
% if (x) < -1, P(x) = 0
% if (x) > 1, P(x) = (0.25 + 0.5 + 0.25) = 1

NumberOfSamples = 10000;

%vector containing the results of each sample taken
results = zeros(1, NumberOfSamples);

for k = 1:NumberOfSamples
    
    x = myRand();
    
    results(k) = x;
    
end

% Creating p(x), using variables px = 0.5*x + 0.5
x = -1:1/1000:1;
px = 0.5*x + 0.5;

%Plotting
figure(1)
histogram(results, 'Normalization', 'pdf')
hold on
plot(x, px, 'r-')
xlabel('x value');
ylabel('p(x) value');
legend('myRand','p(x)', 'Location', 'North')
title('Custom Probability Density Function')

