% selection Performs selection on the population using Binary Tournament
% selection
%   Inputs:
%       chromosomePopulation: an array containing all the chromosomes in
%                the optimization (array of uint32)
%       fitness: function handle for evaluating the fitness of a solution
%                in the original solution space
%       decodeChromosome: function handle for decoding a chromosome
%   Output:
%       chromosomeSubpopulation: a new array of chromosomes selected using                
%                the Binary Tournament selection policy (array of uint32)

%Final Project - Selection Function
%Performs selection on the population using Binary Tournament selection
%Duncan Di Mauro
%805163177

function chromosomeSubpopulation = selection(chromosomePopulation, ...
    fitness, decodeChromosome)

%Pre-allocating space for the Chromosome Subpopulation
chromosomeSubpopulation = (zeros(length(chromosomePopulation)-1, 1, 'uint32')); 


%Loop that finds 2 random chromosomes and stores the one with higher
%fitness in the Subpopulation array

for n = 1:length(chromosomePopulation)-1
    
%Finding random Chromosome (choosing random column of chromosomePopulation)
    randChromosome1 = (ceil(rand()*length(chromosomePopulation)));
    
%Making sure we choose a different Chromosome for randChromosome2
    randChromosome2 = randChromosome1;
    while randChromosome2 == randChromosome1 
    randChromosome2 = (ceil(rand()*length(chromosomePopulation)));
    end 
    
%Finding theta (array of link angles, theta1-theta4) for each chromosome
thetaChromosome1 = decodeChromosome(chromosomePopulation(randChromosome1));
thetaChromosome2 = decodeChromosome(chromosomePopulation(randChromosome2));

%Finding fitnesses of each chromosome
    Fitness1 = fitness(thetaChromosome1);
    Fitness2 = fitness(thetaChromosome2);
    
%Assigning the chromosome with higher fitness to the subpopulation
%If fitnesses are equal, the 2nd chromosome is chosen
    if Fitness1 > Fitness2
        chromosomeSubpopulation(n) = chromosomePopulation(randChromosome1);
    elseif Fitness2 >= Fitness1
        chromosomeSubpopulation(n) = chromosomePopulation(randChromosome2);
    end
    
    %for loop ends
end
end


    

