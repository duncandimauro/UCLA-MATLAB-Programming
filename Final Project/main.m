%Final Project Main Script
%Calls the geneticAlgorithm function and prints/plots the final angles
%Duncan Di Mauro
%805163177

clc; close all; clear all;

%Given Values
populationSize = 1001;
pCrossover = 0.8;
pMutation = 0.3;

%Finding the optimal robotic arm angles using the geneticAlgorithm function
xOpt = geneticAlgorithm...
    (@fitness, @decodeChromosome, populationSize, pCrossover, pMutation);
    
%Printing the final values of the angles
fprintf('\n%s \n%.4f %.4f %.4f %.4f\n', ...
    'Final angle values (radians) for angles 1, 2, 3, 4 are:', ...
    xOpt(1), xOpt(2), xOpt(3), xOpt(4))

%% Creating Figure of Robotic Arm
 
%GIVENS
L = [0.6,0.4,0.3,0.2]; %Lengths of Robotic Arm Links
xo1 = 0; yo1 = 0.8; %X and Y values of object 1 location
xo2 = 0.5; yo2 = 0.4; %X and Y values of object 2 location
xg = 1; yg = 1; %X and Y values of goal location

%Finding Arm Endpoint Locations (Used for graphing)

LinkLength = L.*cos(xOpt); %Lengths of Links in positive x-direction
LinkHeight = L.*sin(xOpt); %Heights of Links in positive y-direction

%Preallocating Space: x and y values for each link's endpoint
LinkEndX = (1:4); LinkEndY = (1:4);

%Finding LinkEndX and LinkEndY
for i = 1:4
    
    if i == 1 %if it is the first link
        LinkEndX(i) = LinkLength(i);
        LinkEndY(i) = LinkHeight(i);
        
    else %if it is not the first link
        LinkEndX(i) = LinkLength(i) + LinkEndX(i-1);
        LinkEndY(i) = LinkHeight(i) + LinkEndY(i-1);
    end
end

figure

%Note: Variable L is used as a handle to call when creating the legend

%Plotting Links
L(1) = plot([0, LinkEndX(1)], [0, LinkEndY(1)], ...              %Link 1
    'Color', 'b', 'LineWidth', 4);
hold on
plot([LinkEndX(1), LinkEndX(2)], [LinkEndY(1), LinkEndY(2)], ... %Link 2
    'Color', 'b', 'LineWidth', 4)
hold on
plot([LinkEndX(2), LinkEndX(3)], [LinkEndY(2), LinkEndY(3)], ... %Link 3
    'Color', 'b', 'LineWidth', 4)
hold on
plot([LinkEndX(3), LinkEndX(4)], [LinkEndY(3), LinkEndY(4)], ... %Link 4
    'Color', 'b', 'LineWidth', 4)
hold on

%Plotting Joints of Robotic Arm
plot(LinkEndX(1:3), LinkEndY(1:3), 'b.', 'MarkerSize', 30);

%Plotting Objects
L(2) = plot(xo1, yo1, 'k.', 'MarkerSize', 30);                   %Object 1
hold on
plot(xo2, yo2, 'k.', 'MarkerSize', 30)                           %Object 2
hold on

%Plotting the Goal
L(3) = plot(xg, yg, 'r.', 'MarkerSize', 30);                     %Goal
hold on

%Customizing graph & creating legend
grid on
xlim([-.4, 1.4])
ylim([0, 1.4])
xlabel('X axis (m)')
ylabel('Y axis (m)')
title('Optimal Robotic Arm Angles Obtained via Genetic Algorithm')
legend(L([1, 2, 3]), {'Robotic Arm', 'Obstacles', 'Goal'},...
    'Location', 'northwest')
