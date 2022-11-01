%The Game of Life
%Simulates and Plots living cells on a grid using Conway's "Game of Life"
%Duncan Di Mauro
%805163177

clc; close all; clear all

%GIVEN VALUES

num_cols = 140;
num_rows = 180;
MaxGenerations = 300;

%Creating the initial cell grid/matrix

%Assigns random numbers 0 to 100000 for all values in a matrix
distribution = randi([0, 100000], num_rows, num_cols);

Cells = zeros(size(distribution));

Cells(distribution<=80000) = 0; % 80% chance of being dead
Cells(distribution>80000) = 1; % 20% chance of being alive

%Storing Initial Cell Matrix & Creating Variables for use in main loop 
    
InitialGeneration = Cells;
CurrentGeneration = InitialGeneration;
newGeneration = InitialGeneration; %This will be updated in the main loop

%Creating Vectors later used for plotting

TimeVector = 0:MaxGenerations; %making the time vector
CellsAlive = 0:MaxGenerations; %pre-allocating space
CellsAlive(1) = sum(InitialGeneration, 'all'); %putting in the initial value

%Plotting Initial Generation of Cells

    figure(1);
    imagesc(InitialGeneration);
    colormap gray
    axis square
    title('Game of Life - Initial Generation')
    xlabel('Column Number')
    ylabel('Row Number')

%% Main Loop
    
for GenerationNumber = 1:MaxGenerations

    %FOR THE CELLS THAT ARE NOT ON A BOUNDARY
    
    for row = 2:(num_rows-1)
        for column = 2:(num_cols-1) 
            if CurrentGeneration(row,column)==1 % If cell is alive
                AliveNeighbors = sum(sum(CurrentGeneration...
                    (row-1:row+1,column-1:column+1)))-1;
                if AliveNeighbors < 2 % Death from underpopulation
                    newGeneration(row,column)=0;
                end
                if AliveNeighbors >= 2 && AliveNeighbors <= 3% Cell survives
                    newGeneration(row,column)=1;
                end
                if AliveNeighbors > 3 % Death by overpopulation
                    newGeneration(row,column)=0;
                end
            else %If cell is not alive
                AliveNeighbors = sum(sum(CurrentGeneration...
                    (row-1:row+1,column-1:column+1)));
                if AliveNeighbors == 3 %Cell is birthed
                    newGeneration(row,column)=1;
                end
            end
        end
    end
    
    %FOR CELLS ON UPPER BOUNDARY
    
    for row = 1
        for column = 2:(num_cols-1) 
            if CurrentGeneration(row,column)==1 % If cell is alive
                AliveNeighbors = sum(sum(CurrentGeneration...
                    (row:row+1,column-1:column+1)) + ...
                    sum(CurrentGeneration(num_rows, column-1:column+1)))-1;
                if AliveNeighbors < 2 % Death from underpopulation
                    newGeneration(row,column)=0;
                end
                if AliveNeighbors >= 2 && AliveNeighbors <= 3% Cell survives
                    newGeneration(row,column)=1;
                end
                if AliveNeighbors > 3 % Death by overpopulation
                    newGeneration(row,column)=0;
                end
            else %If cell is not alive
                AliveNeighbors = sum(sum(CurrentGeneration...
                    (row:row+1,column-1:column+1)) + ...
                    sum(CurrentGeneration(num_rows, column-1:column+1)))-1;
                if AliveNeighbors == 3 %Cell is birthed
                    newGeneration(row,column)=1;
                end
            end
        end
    end
    
    %FOR CELLS ON LOWER BOUNDARY
    
    for row = num_rows
        for column = 2:(num_cols-1) 
            if CurrentGeneration(row,column)==1 % If cell is alive
                AliveNeighbors = sum(sum(CurrentGeneration...
                    (row-1:row,column-1:column+1)) + ...
                    sum(CurrentGeneration(1, column-1:column+1)))-1;
                if AliveNeighbors < 2 % Death from underpopulation
                    newGeneration(row,column)=0;
                end
                if AliveNeighbors >= 2 && AliveNeighbors <= 3% Cell survives
                    newGeneration(row,column)=1;
                end
                if AliveNeighbors > 3 % Death by overpopulation
                    newGeneration(row,column)=0;
                end
            else %If cell is not alive
                AliveNeighbors = sum(sum(CurrentGeneration...
                    (row-1:row,column-1:column+1)) + ...
                    sum(CurrentGeneration(1, column-1:column+1)))-1;
                if AliveNeighbors == 3 %Cell is birthed
                    newGeneration(row,column)=1;
                end
            end
        end
    end
    
    %FOR CELLS ON LEFT BOUNDARY
    
    for row = 2:(num_rows-1)
        for column = 1
            if CurrentGeneration(row,column)==1 % If cell is alive
                AliveNeighbors = sum(sum(CurrentGeneration...
                    (row-1:row+1,column:column+1)) + ...
                    sum(CurrentGeneration(row-1:row+1, num_cols)))-1;
                if AliveNeighbors < 2 % Death from underpopulation
                    newGeneration(row,column)=0;
                end
                if AliveNeighbors >= 2 && AliveNeighbors <= 3% Cell survives
                    newGeneration(row,column)=1;
                end
                if AliveNeighbors > 3 % Death by overpopulation
                    newGeneration(row,column)=0;
                end
            else %If cell is not alive
                AliveNeighbors = sum(sum(CurrentGeneration...
                    (row-1:row+1,column:column+1)) + ...
                    sum(CurrentGeneration(row-1:row+1, num_cols)))-1;
                if AliveNeighbors == 3 %Cell is birthed
                    newGeneration(row,column)=1;
                end
            end
        end
    end
    
    %FOR CELLS ON RIGHT BOUNDARY
    
    for row = 2:(num_rows-1)
        for column = num_cols
            if CurrentGeneration(row,column)==1 % If cell is alive
                AliveNeighbors = sum(sum(CurrentGeneration...
                    (row-1:row+1,column-1:column)) + ...
                    sum(CurrentGeneration(row-1:row+1, 1)))-1;
                if AliveNeighbors < 2 % Death from underpopulation
                    newGeneration(row,column)=0;
                end
                if AliveNeighbors >= 2 && AliveNeighbors <= 3% Cell survives
                    newGeneration(row,column)=1;
                end
                if AliveNeighbors > 3 % Death by overpopulation
                    newGeneration(row,column)=0;
                end
            else %If cell is not alive
                AliveNeighbors = sum(sum(CurrentGeneration...
                    (row-1:row+1,column-1:column)) + ...
                    sum(CurrentGeneration(row-1:row+1, 1)))-1;
                if AliveNeighbors == 3 %Cell is birthed
                    newGeneration(row,column)=1;
                end
            end
        end
    end
    
    %FOR CELL ON TOP LEFT CORNER
    
    if CurrentGeneration(1,1)==1 % If cell is alive
        AliveNeighbors = sum(sum(CurrentGeneration(1:2,1:2)) + ...
            CurrentGeneration(num_rows,num_cols) + ...
            sum(CurrentGeneration(num_rows,1:2)) + ...
            sum(CurrentGeneration(1:2, num_cols)))-1;
        if AliveNeighbors < 2 % Death from underpopulation
            newGeneration(1,1)=0;
        end
        if AliveNeighbors >= 2 && AliveNeighbors <= 3% Cell survives
            newGeneration(1,1)=1;
        end
        if AliveNeighbors > 3 % Death by overpopulation
            newGeneration(1,1)=0;
        end
    else %If cell is not alive
        AliveNeighbors = sum(sum(CurrentGeneration(1:2,1:2)) + ...
            CurrentGeneration(num_rows,num_cols) + ...
            sum(CurrentGeneration(num_rows,1:2)) + ...
            sum(CurrentGeneration(1:2, num_cols)))-1;
        if AliveNeighbors == 3 %Cell is birthed
            newGeneration(1,1)=1;
        end
    end

    %FOR CELL ON TOP RIGHT CORNER
    
    if CurrentGeneration(1,num_cols)==1 % If cell is alive
        AliveNeighbors = sum(sum(CurrentGeneration(1:2,num_cols-1:num_cols)) + ...
            CurrentGeneration(num_rows,1) + ...
            sum(CurrentGeneration(num_rows,num_cols-1:num_cols)) + ...
            sum(CurrentGeneration(1:2, 1)))-1;
        if AliveNeighbors < 2 % Death from underpopulation
            newGeneration(1,num_cols)=0;
        end
        if AliveNeighbors >= 2 && AliveNeighbors <= 3% Cell survives
            newGeneration(1,num_cols)=1;
        end
        if AliveNeighbors > 3 % Death by overpopulation
            newGeneration(1,num_cols)=0;
        end
    else %If cell is not alive
        AliveNeighbors = sum(sum(CurrentGeneration(1:2,num_cols-1:num_cols)) + ...
            CurrentGeneration(num_rows,1) + ...
            sum(CurrentGeneration(num_rows,num_cols-1:num_cols)) + ...
            sum(CurrentGeneration(1:2, 1)))-1;
        if AliveNeighbors == 3 %Cell is birthed
            newGeneration(1,num_cols)=1;
        end
    end    
    
    %FOR CELL ON BOTTOM LEFT CORNER
    
    if CurrentGeneration(num_rows,1)==1 % If cell is alive
        AliveNeighbors = sum(sum(CurrentGeneration(num_rows-1:num_rows,1:2)) + ...
            CurrentGeneration(1,num_cols) + ...
            sum(CurrentGeneration(1,1:2)) + ...
            sum(CurrentGeneration(num_rows-1:num_rows, num_cols)))-1;
        if AliveNeighbors < 2 % Death from underpopulation
            newGeneration(num_rows,1)=0;
        end
        if AliveNeighbors >= 2 && AliveNeighbors <= 3% Cell survives
            newGeneration(num_rows,1)=1;
        end
        if AliveNeighbors > 3 % Death by overpopulation
            newGeneration(num_rows,1)=0;
        end
    else %If cell is not alive
        AliveNeighbors = sum(sum(CurrentGeneration(num_rows-1:num_rows,1:2)) + ...
            CurrentGeneration(1,num_cols) + ...
            sum(CurrentGeneration(1,1:2)) + ...
            sum(CurrentGeneration(num_rows-1:num_rows, num_cols)))-1;
        if AliveNeighbors == 3 %Cell is birthed
            newGeneration(num_rows,1)=1;
        end
    end        
    
    %FOR CELL ON BOTTOM RIGHT CORNER
    
    if CurrentGeneration(num_rows,num_cols)==1 % If cell is alive
        AliveNeighbors = sum(sum(CurrentGeneration...
            (num_rows-1:num_rows,num_cols-1:num_cols)) + ...
            CurrentGeneration(1,1) + ...
            sum(CurrentGeneration(1,num_cols-1:num_cols)) + ...
            sum(CurrentGeneration(num_rows-1:num_rows, 1)))-1;
        if AliveNeighbors < 2 % Death from underpopulation
            newGeneration(num_rows,num_cols)=0;
        end
        if AliveNeighbors >= 2 && AliveNeighbors <= 3% Cell survives
            newGeneration(num_rows,num_cols)=1;
        end
        if AliveNeighbors > 3 % Death by overpopulation
            newGeneration(num_rows,num_cols)=0;
        end
    else %If cell is not alive
        AliveNeighbors = sum(sum(CurrentGeneration...
            (num_rows-1:num_rows,num_cols-1:num_cols)) + ...
            CurrentGeneration(1,1) + ...
            sum(CurrentGeneration(1,num_cols-1:num_cols)) + ...
            sum(CurrentGeneration(num_rows-1:num_rows, 1)))-1;
        if AliveNeighbors == 3 %Cell is birthed
            newGeneration(num_rows,num_cols)=1;
        end
    end
    
    %EVERY CELL HAS 1% CHANCE OF DYING
    
    for row = 1:num_rows
        for column = 1:num_cols
            chance = rand()*100;
            if chance <= 1
                newGeneration(row,column)=0;
            end
        end
    end
    
    %Updating this value for the next iteration of the loop
    CurrentGeneration = newGeneration;
        
    %Plotting the grid of cells
    figure(2);
    imagesc(CurrentGeneration);
    colormap gray
    axis square
    xlabel('Column Number')
    ylabel('Row Number')
    title(sprintf('Game of Life w/ 1%c Chance to Die - Generation %i',...
        '%', GenerationNumber))
    frames(GenerationNumber) = getframe(gcf); %Getting frame data for video
    drawnow
    
    %Calculating and Storing the amount of alive cells per generation
    CellsAlive(GenerationNumber + 1) = sum(CurrentGeneration, 'all');
    
end

%Finding portion of living cells and plotting vs Time

PortionLiving = CellsAlive/(num_rows*num_cols);

figure(3)
plot(TimeVector, PortionLiving, 'r.')
hold on
xlabel('Time (Generation Number)')
ylabel('Portion of Total Cells Alive')
title('Alive Cells over Time - Game of Life w/ 1% Chance to Die')

%Creating the Video

% create the video writer with 15 fps
  v = VideoWriter('CellSimulation.avi');
  v.FrameRate = 15; % set the seconds per image

open(v); % open the video writer

% write the frames to the video
for GenerationNumber=1:length(frames)
    frame = frames(GenerationNumber); % convert the image to a frame
    writeVideo(v, frame);
end

close(v); % close the writer object
