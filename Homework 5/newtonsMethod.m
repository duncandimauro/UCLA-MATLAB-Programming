% Inputs:
% f: a function handle
% x0: the starting point of the optimization
% iterations: number of iterations to run
% Outputs:
% xMins: a vector containing all the minimizers

%Optimization, hw5 p1
%Function that performs Newton's Method on a given function
%Duncan Di Mauro
%805163177

function xMins = newtonsMethod(f, x0, iterations)

xMins = zeros(1, iterations + 1);

%Setting the variables equal to their given values
dx = 0.0001;

%Setting the initial value of xk
xk = x0;

% This loop says - update the minimzer value using the given equation and
% store the values into the vector "xMins". The loop accounts for the
% initial given value x0 and then does "iterations" amount of iterations. 

    for k = 1:iterations + 1
        xMins(k) = xk;
        xkp1 = xk - (computeGradient(f, xk, dx))/...
            (computeSecondGradient(f, xk, dx));      %Eq 2 from hw
        xk = xkp1;
    end
end
