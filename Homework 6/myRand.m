% Outputs:
% x: the random sample drawn from p(x)

%Implementing Custom Probability Distributions hw6 p1
%Creates a function that outputs a random sample x drawn from p(x)
%Duncan Di Mauro
%805163177

% Rearranging Main Equation in terms of x

% P(x) = y = (0.25*x^2 + 0.5*x + 0.25) = ((x + 1)^2)/4
% 2*sqrt(y) = x + 1
% x = 2*sqrt(y) - 1 

%Note: we take the positive sqrt(y) since x must be between -1 & 1

function x = myRand()
y = rand();
x = 2*sqrt(y) - 1;
end
