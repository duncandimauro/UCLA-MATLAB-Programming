% Inputs:
% f: a function handle
% xk: a point at which to evaluate the derivative of the function
% dx: a step sized for computing the derivative
% Outputs:
% dydx: the numerical value of the derivative

%Optimization, hw5 p1
%Function that computes the gradient of a given function
%Duncan Di Mauro
%805163177


function dydx = computeGradient(f, xk, dx)

%3-point central difference equation found from lecture slide 32
dydx = (f(xk + dx) - f(xk - dx))/(2*dx);

end
