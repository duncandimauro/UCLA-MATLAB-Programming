% fitness Evaluates the normalized fitness score of a solution
%   Inputs:
%       theta: array of link angles, theta1-theta4
%   Outputs:
%       score: a normalized score, score should be in the range [-inf,1]

%Final Project - Fitness Function
%Evaluates the normalized fitness score of a solution
%Duncan Di Mauro
%805163177

function score = fitness(theta)
%% Givens

L = [0.6,0.4,0.3,0.2]; %Lengths of Robotic Arm Links

xo1 = 0; yo1 = 0.8; %X and Y values of object 1 location
xo2 = 0.5; yo2 = 0.4; %X and Y values of object 2 location
xg = 1; yg = 1; %X and Y values of goal location


%% Finding Arm Endpoint Location & Center of Mass for Each Robotic Arm Link

LinkLength = L.*cos(theta); %Lengths of Links in positive x-direction
LinkHeight = L.*sin(theta); %Heights of Links in positive y-direction

%Preallocating Space: x and y values for each link's endpoint
LinkEndX = (1:4); LinkEndY = (1:4);

%Preallocating Space: x and y values for each link's center of mass
CMx = (1:4); CMy = (1:4);

%Finding LinkEndX, LinkEndY, CMx, and CMy
for i = 1:4
    
    if i == 1 %if it is the first link
        LinkEndX(i) = LinkLength(i);
        LinkEndY(i) = LinkHeight(i);
        CMx(i) = LinkLength(i)/2;
        CMy(i) = LinkHeight(i)/2;
        
    else %if it is not the first link
        LinkEndX(i) = LinkLength(i) + LinkEndX(i-1);
        LinkEndY(i) = LinkHeight(i) + LinkEndY(i-1);
        CMx(i) = LinkEndX(i-1) + LinkLength(i)/2;
        CMy(i) = LinkEndY(i-1) + LinkHeight(i)/2;
    end
end

%Endpoint of the Arm with coordinates (x, y) = (xe, ye)
xe = LinkEndX(4); ye = LinkEndY(4);


%% Finding error from the goal (fg) and fitness for obstacle avoidance (fo)

fg = sqrt((xg - xe)^2 + (yg - ye)^2); %Eq (1)

fo = 0; %Initialize a value for fo

for i = 1:4

    % Applying Eq (2):
    % fo = Sum(Link #1-4 CM to object 1 + Link #1-4 CM to object 2) 
    % where CM = center of mass
    fo = fo + sqrt((xo1 - CMx(i))^2 + (yo1 - CMy(i))^2) + ...
        sqrt((xo2 - CMx(i))^2 + (yo2 - CMy(i))^2);
end    

%% Finding fitness score

score = 1 - fg - (5.173 - fo)/5.173; %Eq (3)

end
