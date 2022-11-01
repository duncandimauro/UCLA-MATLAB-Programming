%Write a MATLAB program that simulates pendulum
%Simulates a Pendelum for 4 types of motion and creates angle vs. time graphs
%Duncan Di Mauro
%805163177

clc; close all; clear all;

%% Given Values

%Note: "exp" means we are using the explicit Euler method and "semi"
%means we are using the semi-implicit Euler method. The word "damp" after
%the variable means that it is affected by damping

%Initial Angle and Angular Velocity Values

w_exp_k = 0;
w_semi_k = 0;
wdamp_exp_k = 0;
wdamp_semi_k = 0;
theta_exp_k = 0.1;
theta_semi_k = 0.1;
thetadamp_exp_k = 0.1;
thetadamp_semi_k = 0.1;

g = 10;
L = 10;
d = 0.01;

t_initial = 0;
t_final = 50;
delta_t = 0.01;
t_steps = ceil((t_final - t_initial)/delta_t);

w_exp = zeros(1, t_steps);
w_semi = zeros(1, t_steps);
wdamp_exp = zeros(1, t_steps);
wdamp_semi = zeros(1, t_steps);
theta_exp = zeros(1, t_steps);
theta_semi = zeros(1, t_steps);
thetadamp_exp = zeros(1, t_steps);
thetadamp_semi = zeros(1, t_steps);
t = linspace(t_initial, t_final, t_steps);

%% Loop to find, store, and plot values of theta over given time interval

for k = 1:t_steps
    
    %Explicit Method
    
    w_exp(k) = w_exp_k;
    theta_exp(k) = theta_exp_k;
    
    w_exp_kp1 = w_exp_k - delta_t*(g/L)*sin(theta_exp_k);
    theta_exp_kp1 = theta_exp_k + delta_t*w_exp_k; 
    
    w_exp_k = w_exp_kp1;
    theta_exp_k = theta_exp_kp1;
    
    %Semi-Implicit Method
    
    w_semi(k) = w_semi_k;
    theta_semi(k) = theta_semi_k;
    
    w_semi_kp1 = w_semi_k - delta_t*(g/L)*sin(theta_semi_k);
    theta_semi_kp1 = theta_semi_k + delta_t*w_semi_kp1; 
    
    w_semi_k = w_semi_kp1;
    theta_semi_k = theta_semi_kp1;
    
    %Explicit Method Damping
    
    wdamp_exp(k) = wdamp_exp_k;
    thetadamp_exp(k) = thetadamp_exp_k;
    
    wdamp_exp_kp1 = wdamp_exp_k - delta_t*((g/L)*sin(thetadamp_exp_k) + ...
        wdamp_exp_k*L*d);
    thetadamp_exp_kp1 = thetadamp_exp_k + delta_t*wdamp_exp_k; 
    
    wdamp_exp_k = wdamp_exp_kp1;
    thetadamp_exp_k = thetadamp_exp_kp1;
    
    %Semi-Implicit Method Damping
    
    wdamp_semi(k) = wdamp_semi_k;
    thetadamp_semi(k) = thetadamp_semi_k;
    
    wdamp_semi_kp1 = wdamp_semi_k - delta_t*((g/L)*sin(thetadamp_semi_k) + ...
        wdamp_semi_k*L*d);
    thetadamp_semi_kp1 = thetadamp_semi_k + delta_t*wdamp_semi_kp1; 
    
    wdamp_semi_k = wdamp_semi_kp1;
    thetadamp_semi_k = thetadamp_semi_kp1;
    
    
end

%% Plotting Graphs

%Plotting/labelling graph for Explicit and Semi-Implicit Methods

figure(1);
plot(t,theta_exp,'r.');
hold on
plot(t,theta_semi, 'b.');
hold on
xlabel('Time (seconds)');
ylabel('Angle (rad)');
legend('Explicit','Semi-Implicit')
saveas(figure(1), 'Figure 1')

%Plotting/labelling graph for Explicit and Semi-Implicit Methods with Damping

figure(2);
plot(t,thetadamp_exp,'r.');
hold on
plot(t,thetadamp_semi, 'b.');
hold on
xlabel('Time (seconds)');
ylabel('Angle (rad)');
legend('Explicit (Damped)','Semi-Implicit (Damped)')
saveas(figure(2), 'Figure 2')
