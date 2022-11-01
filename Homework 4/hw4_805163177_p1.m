%Correlation Coefficient Between Two Populations
%Computes Correlation Coefficient & Creates Graph of two Competing Populations
%Duncan Di Mauro
%805163177

clc; close all; clear all;

%% GIVEN VALUES AND EQUATIONS

% X represents the lynx population (thousands)
% Y represents the hare population (thousands)

xk = 20; %the start value of x is 20 - "xk" is the value of x at step k
yk = 2;  %the start value of y is 2 - "yk" is the value of y at step k
t_initial = 0;
t_final = 40;
delta_t = .01;
t_steps = ceil((t_final - t_initial)/delta_t);

x = zeros(1, t_steps);
y = zeros(1, t_steps);
t = linspace(t_initial, t_final, t_steps);

xpeak = -10; %(initial peak value needs to be low so it can be overwritten)
ypeak = -10; %(initial peak value needs to be low so it can be overwritten)


% The following are the discretized governing equations obtained using the 
% forward Euler method on the given Lotka-Volterra equations for the two 
% populations

% xkp1 = xk + delta_t*(0.4*xk - 0.018*xk*yk))
% ykp1 = yk + delta_t*(-0.8*yk + 0.023*xk*yk)

% xkp1 represents the value of x at step (k + 1). 
% ykp1 represents the value of y at step (k + 1). 

%% Loop to find, store, and plot values of X and Y over given time interval

for k = 1:t_steps
    
    x(k) = xk;
    y(k) = yk;   
    
    if x(k) > xpeak                   %Finding Data for Peak X Values
        xpeak = x(k);
        txpeak = k*delta_t;
    end 
    
    if y(k) > ypeak                   %Finding Data for peak Y Values
        ypeak = y(k);
        typeak = k*delta_t;
    end 
    
    xkp1 = xk + delta_t*(0.4*xk - 0.018*xk*yk);
    ykp1 = yk + delta_t*(-0.8*yk + 0.023*xk*yk);
    
    if xkp1 < xpeak && xpeak == x(k)  %Printing Data for Peak X Values
    fprintf('\t%s\t%f\n\t\t\t\t\t   %s\t%f\n\n',...
        'Peak X Population Value:', xpeak, 'Time:', txpeak)
    end    
    
    if ykp1 < ypeak && ypeak == y(k)  %Printing Data for Peak Y Values
    fprintf('\t%s\t%f\n\t\t\t\t\t   %s\t%f\n\n',...
        'Peak Y Population Value:', ypeak, 'Time:', typeak)
    end    
    
    xk = xkp1;
    yk = ykp1;
end


%Plotting and labelling graph for species X and species Y
figure(1);
plot(t,x,'b.');
hold on
plot(t,y,'r.');
hold on
xlabel('Time (years)');
ylabel('Population of Species (thousands)');
legend('Hare', 'Lynx')
saveas(figure(1), 'Figure 1')    


%% Calculating oscillation periods and extracting data for 1 period

%  After running the simulation once and printing the data for peak X and Y
%  values, I now assign the time values to variables as seen below and
%  calculate the period averages. I ignore the first set of Y-population 
%  peak data since it is clear from the graph that it is not a real peak.

txpeak1 = 5.04;
txpeak2 = 18.8;
txpeak3 = 32.67; 
xperiod1 = txpeak2 - txpeak1;
xperiod2 = txpeak3 - txpeak2;
xperiodavg = (xperiod1 + xperiod2)/2;
xperiodavgsteps = round(xperiodavg/delta_t, -1);
%It was necessary to round to the 10s place so that the period of X and Y
%could be equal - the periods need to be equal to calculate the correlation
%coefficient


x_time_start = 5.2; %Given in the homework

%Array holding x values starting from x_time_start and going 1 period
x_extracted = x(x_time_start/delta_t:(x_time_start/delta_t + xperiodavgsteps));


typeak1 = 6.55;
typeak2 = 20.29;
typeak3 = 34.15;
yperiod1 = typeak2 - typeak1;
yperiod2 = typeak3 - typeak2;
yperiodavg = (yperiod1 + yperiod2)/2;
yperiodavgsteps = round(yperiodavg/delta_t, -1);
%It was necessary to round to the 10s place so that the period of X and Y
%could be equal - the periods need to be equal to calculate the correlation
%coefficient

y_time_start = 5.2; %Given in the homework

%Array holding x values starting from x_time_start and going 1 period
y_extracted = y(y_time_start/delta_t:(y_time_start/delta_t + yperiodavgsteps));


%Equation for Pearson's linear correlation coefficient between two species

x_mean = mean(x_extracted);
y_mean = mean(y_extracted);

rxy = sum((x_extracted - x_mean).*(y_extracted - y_mean))/...
((sqrt(sum((x_extracted - x_mean).^2)))*(sqrt(sum((y_extracted - y_mean).^2))));

%Printing
fprintf('\n%s %f\n\n', 'The correlation coefficient rxy = ', rxy)
