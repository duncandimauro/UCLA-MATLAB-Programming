% Inputs:
% L: length of the needle
% gridWidth: width of the grid
% gridHeight: height of the grid
% Outputs:% x: x-position of the dropped needle 
% y: y-position of the dropped needle
% theta: angle of the dropped needle with the x-axis

%Dropping a Needle on a Grid hw6 p4
%Creates a function that simulates dropping a needle at a random position
%Duncan Di Mauro
%805163177

function [x, y, theta] = dropNeedle(L, gridWidth, gridHeight)

r = 0.5*L; %This is the radius of the needle

FLAG = false;
while ~FLAG
    
% Obtaining random values for x-position, y-position, and theta
% Note: the x and y positions are the positions of the needle's center
    x = rand()*gridWidth;
    y = rand()*gridHeight;
    theta = rand()*pi;
    
    radiusX = r*abs(cos(theta)); %length of the radius in X direction
    radiusY = r*abs(sin(theta)); %length of the radius in Y direction

% Checking to make sure the needle does not cross the boundary
% (But it is allowed to touch the boundary)
    if x - radiusX >= 0 && x + radiusX <= gridWidth ...
            && y - radiusY >= 0 && y + radiusY <= gridHeight
        FLAG = true;
    end 
% If needle crosses the boundary, FLAG is still false, so loop repeats
% and new x, y, and theta values are obtained  
    
end

end


