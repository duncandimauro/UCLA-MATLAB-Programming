%Write a script for permutation, hw3 p3
%Request inputs for n and r and outputs permutation P(n,r).
%Duncan Di Mauro
%805163177

clc; close all; clear all;

%Inputs

n = input('Input value for n: ');
r = input('Input value for r: ');

%Solving for factorials

n_factorial = prod(1:n);
nmr_factorial = prod(1:n-r);        % "nmr" stands for (n minus r)

P = n_factorial/nmr_factorial; 

%Printing Output

fprintf('\n%s %i', 'P(n,r) =', P)