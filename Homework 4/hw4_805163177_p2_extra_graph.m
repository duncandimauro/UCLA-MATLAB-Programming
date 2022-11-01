%Name of
%Function
%Duncan Di Mauro
%805163177

clc; close all; clear all;

% Problem 2, use 
% 
% theta k
% and omega k + 1

% Pendulum Equation: (d/dt)(dtheta/dt) = -(g/L)sin(theta)


%Given Values

%Note: "exp" means we are using the explicit Euler Method and "semi"
%means we are using the semi-implicit Euler Method. The word "damp" after
%the variable means that it is affected by damping

%Initial Angle and Angular Velocity Values

wdamp1_semi_k = 0;
wdamp2_semi_k = 0;
wdamp3_semi_k = 0;
thetadamp1_semi_k = 0.1;
thetadamp2_semi_k = 0.1;
thetadamp3_semi_k = 0.1;


g = 10;
L = 10;
d1 = 0;
d2 = 0.01;
d3 = 10;

t_initial = 0;
t_final = 100;
delta_t = 0.01;
t_steps = ceil((t_final - t_initial)/delta_t);

wdamp1_semi = zeros(1, t_steps);
wdamp2_semi = zeros(1, t_steps);
wdamp3_semi = zeros(1, t_steps);
thetadamp1_semi = zeros(1, t_steps);
thetadamp2_semi = zeros(1, t_steps);
thetadamp3_semi = zeros(1, t_steps);

t = linspace(t_initial, t_final, t_steps);

for k = 1:t_steps
    
    %Semi-Implicit Method Damping d1
    
    wdamp1_semi(k) = wdamp1_semi_k;
    thetadamp1_semi(k) = thetadamp1_semi_k;
    
    wdamp1_semi_kp1 = wdamp1_semi_k - delta_t*((g/L)*sin(thetadamp1_semi_k) + ...
        wdamp1_semi_k*L*d1);
    thetadamp1_semi_kp1 = thetadamp1_semi_k + delta_t*wdamp1_semi_kp1; 
    
    wdamp1_semi_k = wdamp1_semi_kp1;
    thetadamp1_semi_k = thetadamp1_semi_kp1;
    
    %d2
    
    wdamp2_semi(k) = wdamp2_semi_k;
    thetadamp2_semi(k) = thetadamp2_semi_k;
    
    wdamp2_semi_kp1 = wdamp2_semi_k - delta_t*((g/L)*sin(thetadamp2_semi_k) + ...
        wdamp2_semi_k*L*d2);
    thetadamp2_semi_kp1 = thetadamp2_semi_k + delta_t*wdamp2_semi_kp1; 
    
    wdamp2_semi_k = wdamp2_semi_kp1;
    thetadamp2_semi_k = thetadamp2_semi_kp1;
    
    %d3
    
    wdamp3_semi(k) = wdamp3_semi_k;
    thetadamp3_semi(k) = thetadamp3_semi_k;
    
    wdamp3_semi_kp1 = wdamp3_semi_k - delta_t*((g/L)*sin(thetadamp3_semi_k) + ...
        wdamp3_semi_k*L*d3);
    thetadamp3_semi_kp1 = thetadamp3_semi_k + delta_t*wdamp3_semi_kp1; 
    
    wdamp3_semi_k = wdamp3_semi_kp1;
    thetadamp3_semi_k = thetadamp3_semi_kp1;
    
end

%Plotting and labelling graph with Damping

figure(3);
plot(t,thetadamp1_semi,'g.');
hold on
plot(t,thetadamp2_semi, 'b.');
hold on
plot(t,thetadamp3_semi, 'r.');
hold on
xlabel('Time (seconds)');
ylabel('Angle (rad)');
legend('d = 0/m-s','d = 0.01/m-s', 'd = 10/m-s')
saveas(figure(3), 'Figure 3')