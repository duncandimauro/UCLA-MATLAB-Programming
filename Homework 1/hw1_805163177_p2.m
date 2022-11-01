% Ellipse calculations, Homework 1 Problem #2
% Calculating Perimeter of Ellipse using Different Equations
% Duncan Di Mauro
% 805163177

clc; close all; clear all;

%Prompts for values of a and b

a = input('Value of a: ');

b = input('Value of b: ');

%Creating variable h, which is needed for the equations below

h = ((a - b)/(a + b))^2;

%Coding the equations and assigning their values to variables P1-P8

P1 = pi*(a + b);
P2 = pi*sqrt(2*(a^2 + b^2));
P3 = pi*sqrt((2*(a^2 + b^2))-(((a - b)^2)/2));
P4 = pi*(a + b)*(1 + h/8)^2;
P5 = pi*(a + b)*(1 + (3*h/(10 + sqrt(4 - 3*h))));
P6 = pi*(a + b)*((64 - 3*h^2)/(64 - 16*h));
P7 = pi*(a + b)*((256 - 48*h - 21*h^2)/(256 - 112*h + 3*h^2));
P8 = pi*(a + b)*((3 - sqrt(1 - h))/2);

%Printing the values for P1 through P8

fprintf('\n\t%.6f\t%.6f\t%.6f\t%.6f\n\t%.6f\t%.6f\t%.6f\t%.6f',...
    P1, P2, P3, P4, P5, P6, P7, P8);