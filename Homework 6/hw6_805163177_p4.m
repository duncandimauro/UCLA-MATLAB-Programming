%Dropping a Needle on a Grid hw6 p4
%Simulates and plots dropping samples of needles for different lengths
%Duncan Di Mauro
%805163177

clc; close all; clear all

% Given Values
SampleSize = 10000;
gridWidth = 10;
gridHeight = 10;
Linitial = 0.1;
Lstepsize = 0.1;
Lfinal = 1.6;

ProbCross = 0; %probability that a needle will cross a grid-line

%Vector containing probabilities of crossing grid-line for different L-values
TotalProb = zeros(1, (Lfinal - Linitial)*(1/Lstepsize) + 1);

%Vector containing all L-values
L_vector = zeros(1, (Lfinal - Linitial)*(1/Lstepsize) + 1); 


for L = Linitial:Lstepsize:Lfinal %L goes from 0.1 to 1.6 in increments of 0.1
    
    iteration = round(L*(1/Lstepsize)); %Value of the current iteration
    % Note: for my version of MATLAB, this value needed to be rounded 
    % for some reason, even though it shouldn't be necessary
    
    L_vector(iteration) = L; %Vector containing all L-values
    r = 0.5*L;               %radius of needle
    
    
    %Loop that will drop a SampleSize amount of needles
    for k = 1:SampleSize
        
        [x, y, theta] = dropNeedle(L, gridWidth, gridHeight);
    
        radiusX = r*abs(cos(theta)); %length of the radius in X direction
        radiusY = r*abs(sin(theta)); %length of the radius in Y direction
        
        
    % The following loop says that if any of these are true:
    
    % If the x-values at the needle's ends round up to different integers
    % If the y-values at the needle's ends round up to different integers
    % If the x-value at the needle's rightmost tip is an integer
    % If the y-value at the needle's upper tip is an integer
    
    % Then the needle crosses or touches a grid-line
    % Otherwise, the needle does not cross or touch a grid-line
    
    
        if  ceil(x - radiusX) ~= ceil(x + radiusX) ...
                || ceil(y - radiusY) ~= ceil(y + radiusY) ...
                || mod(x + radiusX, 1) == 0 || mod(y + radiusY, 1) == 0
            
            ProbCross = ProbCross + 1/SampleSize;
        end
    end
    
    TotalProb(iteration) = ProbCross;
    ProbCross = 0; %setting the value back to 0 for the next iteration   
    
end

figure(1)

plot(L_vector, TotalProb, 'r.')
hold on
xlabel('Needle Length (units)');
ylabel('Probability of Crossing Grid Line');
title('Dropping Needles on a Grid')

saveas(figure(1), 'Figure 1')

    
    