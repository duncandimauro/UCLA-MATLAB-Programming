% Inputs:
% P: Value of force in newtons
% L: Length of the bar
% d: Distance between the left-hand edge of bar and force application point
% x: Horizontal location along the bar
% Outputs:
% M: the bending moment

%Euler-Bernoulli Beam Bending, hw7 p1
%Calculates the bending moment M given by Eq (2) in hw7
%Duncan Di Mauro
%805163177

function M = MomentCalc(x, P, d, L)

%Equation (2) in hw

if x >= 0 && x <= d
    M = (-P*(L-d)*x)/L;
elseif x > d && x <= L
    M = (-P*d*(L-x))/L;
end

end