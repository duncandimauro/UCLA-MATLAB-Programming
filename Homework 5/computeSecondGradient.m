% Inputs:
% f: a function handle
% xk: a point at which to evaluate the derivative of the function
% dx: a step sized for computing the derivative
% Outputs:
% d2ydx2: the numerical value of the second derivative

%Optimization, hw5 p1
%Function that computes the second gradient of a given function
%Duncan Di Mauro
%805163177

function d2ydx2 = computeSecondGradient(f, xk, dx)

%Eq found from lecture slide 36
d2ydx2 = (f(xk + dx) - 2*f(xk) + f(xk - dx))/(dx^2);

end