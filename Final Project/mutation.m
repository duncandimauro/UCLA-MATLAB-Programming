%mutation Mutates a chromosome with probability pMutation at a random
%gene
%   Inputs:
%       chromosome: encoded 32-bit value (uint32)
%       pMutation: probability of mutation ranging from 0 to 1
%   Outputs:
%       mutatedChromosome: chromosome with the random bit mutated (uint32)

%Final Project - Mutation Function
%Mutates a chromosome with probability pMutation at a random gene
%Duncan Di Mauro
%805163177

function mutatedChromosome = mutation(chromosome, pMutation)


%A chromosme has a pMutation probability of a random bit mutating
if rand() <= pMutation

    %Choosing a random bit to mutate
    RandBit = ceil(rand()*32);

    BitValue = bitget(chromosome, RandBit);

    %Flipping the chosen bit's value - 0 becomes 1 & 1 becomes 0 
    if BitValue == 1
        chromosome = bitset(chromosome, RandBit, 0);
    elseif BitValue == 0
        chromosome = bitset(chromosome, RandBit, 1);
    end
    
end

%The variable chromosome has now undergone a mutation and is assigned to
%the output variable. If it has not undergone a mutation, then
%the output variable is the same as the input variable
mutatedChromosome = chromosome;

end

