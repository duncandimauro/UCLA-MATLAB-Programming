% Inputs:
% f: a function handle
% tf: the simulation time
% x0: the initial condition

%Simulating Dynamics, hw5 p2
%Simulates and Plots a given first-order differential equation
%Duncan Di Mauro
%805163177

function simulateAndPlot(f, tf, x0)

%Ode45 function used to simulate the behaivor of our function f(x) with time t
[t,x] = ode45(@(t,x) f(x), [0 tf], x0);

%Plotting x-values vs. time
plot(t,x,'r.')
ylim([-1 3]);
xlabel('Time');
ylabel('x-value');

end







