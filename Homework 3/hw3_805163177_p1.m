%Relationship of Two Competing Populations, hw3 p1
%Computes and graphs the populations of two species under competition
%Duncan Di Mauro
%805163177

clc; close all; clear all;


%GIVEN VALUES AND EQUATIONS

alpha = 3;
beta = 2;
gamma = 2;
rho = 1.5;
epsilon = 0.3;
delta = 0.2;

xk = 5; % "xk" representes the value of x at step k
yk = 2; % "yk" representes the value of y at step k
t_initial = 0;
t_final = 10;
delta_t = .01;
t_steps = ceil((t_final - t_initial)/delta_t);


% The following are the discretized governing equations 
% obtained using the forward Euler method on the given Lotka–Volterra
% equations for the two populations

% xkp1 = xk + delta_t*(xk*(alpha - epsilon*xk - beta*yk))
% ykp1 = yk + delta_t*(yk*(-gamma + rho*xk - delta*yk))

% xkp1 represents the value of x at step (k + 1). 
% ykp1 represents the value of y at step (k + 1). 

figure(1);

for k = 0:t_steps
    
    t = t_initial + k*delta_t;
    
    xkp1 = xk + delta_t*(xk*(alpha - epsilon*xk - beta*yk));
    ykp1 = yk + delta_t*(yk*(-gamma + rho*xk - delta*yk));
   
    %Plotting xkp1 and ykp1 for species X and species Y
    
    plot(t,xk,'g.');
    hold on
    plot(t,yk,'r.');
    hold on
    
    %If statement required to print the correct final values
    
    if k == t_steps
        x_final = xk;
        y_final = yk;
    end
    
    xk = xkp1;
    yk = ykp1;
end

% Labelling the graph

    xlabel('Time');
    ylabel('Population of Species (thousands)');
    legend('Species X', 'Species Y')

saveas(figure(1), 'Figure 1')

%Printing Final Species Populations

fprintf('%s \n%s %f \n%s %f\n\n', 'Final Species Population (thousands)', ...
    'Species X: ', x_final, 'Species Y: ', y_final);
