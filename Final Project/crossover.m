% crossover Performs crossover on two chromosomes with a probability 
% pCrossover
%   Inputs:
%       chromosome1: first chromosome (uint32) to crossover
%       chromosome2: second chromosome (uint32) to crossover
%       pCrossover: crossover probability ranging from 0 to 1
%   Outputs:
%       daughter1: first daughter chromosome (uint32)
%       daughter2: second daughter chromosome (uint32)

%Final Project - Crossover Function
%Performs crossover on two chromosomes with a probability pCrossover
%Duncan Di Mauro
%805163177

function [daughter1, daughter2] = crossover(chromosome1, chromosome2, ...
    pCrossover)

% daughters same as parents (pCrossover probability of being changed later)
daughter1 = chromosome1; 
daughter2 = chromosome2;


%There is a pCrossover probability of performing the crossover function
if rand() <= pCrossover
    
    
% Obtaining a random value for m, which places the crossover point
% directly after the mth bit. 
% m can be an integer from 1-32, since there are 32 bits in a chromosome
    
    m = ceil(rand()*32); 
    
    
%Swapping bit values, ie, doing  the crossover
    for bit = 1:m
        daughter1 = bitset(daughter1, bit, bitget(chromosome2, bit));
        daughter2 = bitset(daughter2, bit, bitget(chromosome1, bit));
    end
    
    for bit = m+1:32
        daughter1 = bitset(daughter1, bit, bitget(chromosome1, bit));
        daughter2 = bitset(daughter2, bit, bitget(chromosome2, bit));
    end
end


