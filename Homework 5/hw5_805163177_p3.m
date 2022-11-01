%Linear Regression, hw5 p3
%Main Script p3 - plots dataset and linear regression model
%Duncan Di Mauro
%805163177

clc; close all; clear all


%Loading dataset and applying linear regression
load('hw5_p4_dataset.mat')

[alpha, beta] = linearRegression(x, y);


%Creating linear model with given equation y = alpha + beta*x
%The range of x-values is the same as our dataset

xlin = -10:1/100:20; %We use a sufficiently small step-size of 1/100
ylin = alpha + beta*xlin;


%Finding the R-squared value

%Eq 11
SStotal = sum((y - mean(y)).^2);

%Eq 12
SSresidual = sum((y - alpha - beta.*x).^2);

%Eq 10
rsquared = 1 - SSresidual/SStotal;


%Plotting the dataset and the linear model
figure(1)
plot(x,y,'r.')
hold on
plot(xlin,ylin,'b.')
hold on
xlabel('X-value');
ylabel('Y-value');
legend('Given Data: r^2 = 0.5751 ',...
    'Linear Regression Model: y = 0.5751 + 2.5255x', 'Location', 'South')
saveas(figure(1), 'Figure 1')


