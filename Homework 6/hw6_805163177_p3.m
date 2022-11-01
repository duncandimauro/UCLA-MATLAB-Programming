%Numerical Integration with Monte Carlo hw6 p3
%Integrates a function using the Monte Carlo method
%Duncan Di Mauro
%805163177

clc; close all; clear all

%Equation is 1/(x^2 + 1)

rectangleArea = 5; %We have a 1 x 5 rectangle

SamplesUnder = 0; %This value will be updated later but is initially at 0

MaxNumSamples = 100000;
stepsize = 100; %Stepsize can be smaller but will take a long time to run

%Vector containing all calculated area values
Area = zeros(1, MaxNumSamples/stepsize);

for numSamples = stepsize:stepsize:MaxNumSamples
    
    for i = 1:numSamples
    
        randomx = rand()*5; %Range of x-values is between 0 and 5
        randomy = rand(); %Range of y-values is between 0 and 1
    
        %loop checking if under curve
    
        if randomy < (1/(randomx^2 + 1))
            SamplesUnder = SamplesUnder + 1;
        end
        
    end
    
    %Updating the vector contaning the calculated area values
    Area(numSamples/stepsize) = (SamplesUnder/numSamples)*rectangleArea;
    SamplesUnder = 0;
    
end

%Creating arctan(5) line

x = 0:MaxNumSamples/stepsize;
y = atan(5);

figure(1)

plot(Area, 'b-')
hold on
plot(x, y, 'r.')
xlabel('Number of Samples (hundreds)');
ylabel('Calculated Area');
legend('Monte Carlo','Explicit Solution tan^-^1(5)', 'Location', 'North')
title('Calculation of Integral')

saveas(figure(1), 'Figure 1')
