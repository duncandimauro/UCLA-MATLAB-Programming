%Optimization, hw5 p1
%Main Script p1 - plots the errors vs. time for Gradient Descent and
%Newton's Method
%Duncan Di Mauro
%805163177

clc; close all; clear all

f = @(xk)(3*xk^2 - 4*xk + 6); %Given Function - Eq 3 from hw

%Given values
x0 = 4;
iterations = 100;

%Vector used to plot the number of iterations (including the 0th iteration,
%which is just the initial given values)
iteration_vector = linspace(1, iterations + 1, iterations +1) - 1;

GD = gradientDescent(f, x0, iterations); %GD = "Gradient Descent"
NM = newtonsMethod(f, x0, iterations);   %NM = "Newton's Method"

%The global minimum of the function is 2/3, which was found by hand
GDerror = abs(GD - 2/3);
NMerror = abs(NM - 2/3);

%Plotting
figure(1);
plot(iteration_vector,GDerror,'r.');
hold on
plot(iteration_vector,NMerror, 'b.');
hold on
xlabel('Iteration Number');
ylabel('Error');
legend('Gradient Descent', 'Newtons Method')
saveas(figure(1), 'Figure 1')