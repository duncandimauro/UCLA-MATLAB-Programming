%Quadratic Function, hw2 p#2
%Prints the min and max values of a quadratic function for the range [L, R]
%Duncan Di Mauro
%805163177

clc; close all; clear all;

%% Inputs and Input Errors for L and R
L_string = input('Enter a value for the lower bound, L: ', 's');
R_string = input('Enter a value for the upper bound, R: ', 's');

if str2double(L_string) > str2double(R_string)
    error('Please make sure L is less than R')
end

%% Inputs and Input Errors for a, b, and c

%while-loop that prompts the user to enter a value of "a" until a ~=0
FLAG = false;
while ~FLAG
    a_string = input('Enter a value for a: ', 's');
    if str2double(a_string) == 0
    fprintf('\na should not be zero for a quadratic function\n\n')
    elseif str2double(a_string) ~= 0
       FLAG = true;
    end
end

b_string = input('Enter a value for b: ', 's');
c_string = input('Enter a value for c: ', 's');

%Converting the inputs to numerical values - error if not numerical
L = str2double(L_string);
R = str2double(R_string);
a = str2double(a_string);
b = str2double(b_string);
c = str2double(c_string);
if isnan(L) || isnan(R) || isnan(a) || isnan(b)|| isnan(c)
    error('Please only enter real numbers')
end 

%% Calculating and printing min/max of function

% Creating interval {L,R] 
% x goes from L to R in incriments of 0.001
x = L:0.001:R; 

f = a*(x.^2) + b*x +c; %given function

minimum = min(f); %minimum value
maximum = max(f); %maximum value

%prints the values
fprintf('\nMinimum Value = %0.3f \nMaximum Value = %0.3f', minimum, maximum)
