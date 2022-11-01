%Monty Hall hw6 p2
%Simulates and calculates winning probabilities for the Monty Hall problem
%Duncan Di Mauro
%805163177

clc; close all; clear all

Win = 0;
Loose = 0;
numSamples = 10000;


for i = 1:numSamples
    
%Winning Door and Contestant's Door are randomly assigned
    
    prize = ceil(rand()*3);
    guess1 = ceil(rand()*3);
    
%Now host opens door that isn't the prize and isn't the contestant's door
    
    FLAG = false;
    while ~FLAG
        OpenDoor = ceil(rand()*3);
        if OpenDoor ~= guess1 && OpenDoor ~= prize
            FLAG = true;
        end
    end
    
%Now contestant switches to the remaining door
    
    FLAG = false;
    while ~FLAG
        guess2 = ceil(rand()*3);
        if guess2 ~= guess1 && guess2 ~= OpenDoor
            FLAG = true;
        end
    end
    
%Now it is determined if contestant wins or loses
    
    if guess2 == prize
        Win = Win + 1/numSamples;
    end
    
    if guess2 ~= prize
        Loose = Loose + 1/numSamples;
    end
    
end

fprintf('%s %f', 'The probability of winning is: ', Win)