%Euler-Bernoulli Beam Bending, hw7 p1
%Solves system of equations for bending beam and plots displacement vs. x
%Duncan Di Mauro
%805163177

clc; close all; clear all

%GIVEN VALUES

a = 0.075; %outer width of square tube
b = 0.065; %inner width of square tube
P = -800; %Force value (newtons)
d = .15; %Distance (meters) between left-hand edge of bar & applied force
L = 1; %Length of the bar (meters)
I = ((a^4) - (b^4))/12; %Moment of Inertia Equation and Calculation
E = 200e9; %Modulus of Elasticity (Pa)
maxNodes = 20;
dx = L/(maxNodes - 1);

%Boundary Conditions for y(x):
% y(0) = 0
% y(L) = 0

%Eq (1): d2ydx2*E*I = M(x)


%% Creating the A Matrix

% Left endpoint
A(1, 1) = 1;

%Interior nodes
for k = 2:maxNodes - 1
    A(k, k-1) = 1;
    A(k, k) = -2;
    A(k, k+1) = 1;
end 

%Right Endpoint
A(maxNodes, maxNodes) = 1;


%% Creating b Matrix (right-hand side vector)

b_matrix = zeros(maxNodes, 1);

for nodeNumber = 2:maxNodes - 1
    
    x = dx*(nodeNumber - 1);
    
    M = MomentCalc(x, P, d, L);
    
    %Discretization and Rearranging of Eq (1)
    b_matrix(nodeNumber, 1) = ((dx^2)*M)/(E*I); 
    
end

%% Solve and plotting the results

y = A\b_matrix; %Given in Discussion Slides

x_vector = linspace(0, L, maxNodes);

figure(1)

plot(x_vector, y, 'o-')
hold on
xlabel('x position (m)')
ylabel('y dispalcement (m)')
title('Simulation of Bending Beam')

%% Calculating max displacement, minimizer, ytheoretical, and error

[yMin, location] = min(y);        %finding max displacement
minimizer = x_vector(location);   %finding minimizer

c = min(d, L - d); %Given in hw

ytheo = (P*c*(L^2 - c^2)^(1.5))/(E*I*L*9*sqrt(3)); %Given in hw

percent_error = 100*abs(min(y) - ytheo)/abs(ytheo);

