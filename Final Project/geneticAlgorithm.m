%geneticAlgorithm Implements the genetic algorithm optimizer
% This function will assume that selection.m, crossover.m, mutation.m,
% decodeChromosome.m, and fitness.m are in the same directory
%   Inputs:
%       fitness: function handle for evaluating the fitness of a solution
%                in the original solution space
%       decodeChromosome: function handle for decoding a 32-bit chromosome
%                         into a solution in the original solution space
%       populationSize: number of genes to use in the genetic algorithm
%       pCrossover: probability of crossover
%       pMutation: probability of mutation
%   Outputs:
%       xOpt: optimal solution as expressed in the original solution space

%Final Project - Genetic Algorithm
%Function that implements the genetic algorithm optimizer & creates
%a histogram/video of the population's distribution of fitness values
%Duncan Di Mauro
%805163177

function xOpt = geneticAlgorithm(fitness, decodeChromosome, ...
    populationSize, pCrossover, pMutation)

%Creating Chromosome Population w/ datatype uint32
chromosomePopulation = (randi([0, 2^32 - 1], 1, populationSize, 'uint32'));

%Initializing the first iteration value - will be updated in later loop
Iteration = 0;

%Note:
%If a chromosome in the population has a fitness value > 0.99, then the 
%chromosome converges
%So, we perform the Genetic Algorithm until a chromosome converges, or
%until the maximum fitness value of the population is > 0.99. 
%If this happens, we will set FLAG = true (see the end of the while loop)

FLAG = false;

while ~ FLAG
    
    %Obtaining the Subpopulation using the selection function
    chromosomeSubpopulation = ...
        selection(chromosomePopulation, fitness, decodeChromosome);
    
    %% Applying Crossover and Mutation
    
    %Performing crossover on entire chromosomeSubpopulation and replacing
    %the parent values with the obtained daughter values
    %Parents are adjacent (ie chromosomes with index 1 & 2, 3 & 4, etc)
    for n = 1:2:populationSize-1
        
        [daughter1, daughter2] = crossover(chromosomeSubpopulation(n), ...
            chromosomeSubpopulation(n+1), pCrossover);
        
        chromosomeSubpopulation([n n+1]) = [daughter1, daughter2];
        
    end
    
    
    %Performing mutation on entire chromosomeSubpopulation and replacing
    %current chromosome uint32 values with mutated values
    for n = 1:populationSize-1
        chromosomeSubpopulation(n) = ...
            mutation(chromosomeSubpopulation(n), pMutation);
    end
    
    %% Elitism - Adding fittest chromosome of Population to SubPopulation
    
    %Initializing Vector containing all chromosome fitnesses
    PopulationFitness = (1:populationSize);

    %Finding all chromosome fitnesses and placing them in PopulationFitness
    for n = 1:populationSize
    
    %decodeChromosome is used to extract the necessary theta values used
    %for finding fitness
    PopulationFitness(n) = ...
        fitness(decodeChromosome(chromosomePopulation(n)));
   
    end

    %Finding highest fitness value and its relevant index
    [MaxFitness, fittestChromosome] = max(PopulationFitness); 
    
%While loop ends if the chromosomePopulation converges - this is here in
%case the very first chromosomePopulation converges
    if MaxFitness == 1
        break
    end
    
    %Adding chromosome with highest fitness value to the subpopulation
    chromosomeSubpopulation(populationSize) = ...
        chromosomePopulation(fittestChromosome);
    
    %% Genetic Algorithm complete - new maximum fitness is obtained
    
    %chromosomeSubpopulation becomes the new chromosomePopulation
    chromosomePopulation = chromosomeSubpopulation;
    
    %New highest fitness value/index is obtained via same steps as before
    PopulationFitness = (1:populationSize);
    
    for n = 1:populationSize
    PopulationFitness(n) = ...
        fitness(decodeChromosome(chromosomePopulation(n)));
    end

    [HighestFitness, fittestChromosome] = max(PopulationFitness);
    
    
    %While loop ends once a chromosome converges
    if HighestFitness > 0.99
        FLAG = true;
    end
    
    Iteration = Iteration + 1;
    
    
    %% Storing Fitness/Iteration Data & Making Histogram/Storing Frames
    
    %If this loop is running for the first time, store the iteration,
    %fitness, and histogram data for the initial chromosomePopulation
    if Iteration == 1
        MaxFitnessVector(1) = MaxFitness;
        IterationVector(1) = 0;
    end 
    
    %Add the MaxFitness value to the fitness vector & Iteration value to
    %iteration vector - these vectors expand until the while loop ends
    MaxFitnessVector(Iteration+1) = HighestFitness;
    IterationVector(Iteration+1) = Iteration;
    
    %Plotting the histogram for normalized fitness values in a population
    figure(1)
    histogram(PopulationFitness, 'Normalization', 'probability', ...
        'BinLimits', [0, 1], 'BinWidth', 1/24);
    ylim([0 1])
    xlim([0 1])
    ylabel('Portion of Population')
    xlabel('Fitness Scores')
    title(sprintf(...
        'Solution: Distribution of Chromosomes According to Normalized Fitness'))
    grid on
    frames(Iteration) = getframe(gcf); %Getting frame data for video
    
        
end

%% Max fitness plot, making histogram video, and finding optimal solution

%Plotting Max Fitness per Generation
figure(2)
plot(IterationVector, MaxFitnessVector, 'r-')
hold on
xlabel('Iteration Number')
ylabel('Normalized Fitness Score')
title('Highest Fitness Score per Generation')
grid on


%Creating the Histogram Video

% create the video writer with 1 fps
  v = VideoWriter('PopulationFitness.avi');
  v.FrameRate = 1; % set the seconds per image

open(v); % open the video writer

% write the frames to the video
for Iteration=1:length(frames)
    frame = frames(Iteration); % convert the image to a frame
    writeVideo(v, frame);
end

close(v); % close the writer object


%Finding the optimal X value as expressed in the original solution space
%Gets 4 angles in terms of theta (radians)
xOpt = decodeChromosome(chromosomePopulation(fittestChromosome));

%Function Ends
end