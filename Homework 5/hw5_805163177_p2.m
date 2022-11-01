%Simulating Dynamics, hw5 p2
%Main Script p2 - Simulates and Plots a first-order differential equation
%with four different sets of parameters
%Duncan Di Mauro
%805163177

clc; close all; clear all;

% GIVEN EQUATION
% xdot = @(x)((k - x)/tau);
% f = xdot;


%GIVEN VALUES FOR ALL TRIALS
x0 = 1;
tf = 10;

%Trial 1

f = @(x)((0 - x)/2); %Given equation with appropriate tau and k values 
                     %substituted in
figure(1);
simulateAndPlot(f, tf, x0)
title('Plot of Trial 1')

%Trial 2

f = @(x)((-1 - x)/1);

figure(2);
simulateAndPlot(f, tf, x0)
title('Plot of Trial 2')

%Trial 3

f = @(x)((2 - x)/4);

figure(3);
simulateAndPlot(f, tf, x0)
title('Plot of Trial 3')

%Trial 4

f = @(x)((3 - x)/5);

figure(4);
simulateAndPlot(f, tf, x0)
title('Plot of Trial 4')
