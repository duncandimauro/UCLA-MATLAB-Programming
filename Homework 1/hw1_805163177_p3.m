% Trigonometric calculation, Homework 1 Problem #3
% Finding values for sin(11) and cos(11) using trigonometric identities
% Duncan Di Mauro
% 805163177

clc; close all; clear all;

%Given Values: 
%Cos(60) = 0.5
%Cos(16) = 0.96126169593

%Given Equations (all in degrees unless otherwise specified)

%Eq 1: cos(x/2) = sqrt((1 + cos(x))/2) 
%Eq 2: sin(x/2) = sqrt((1 - cos(x))/2)
%Eq 3: cos(-x) = cos(x)
%Eq 4: sin(-x) = -sin(x)
%Eq 5: cos(a + b) = cos(a)cos(b) - sin(a)sin(b)
%Eq 6: sin(a + b) = cos(a)sin(b) + sin(a)cos(b)

% Notice that cos(11) = cos(15 + (-4)) & sin(11) = sin(15 + (-4))

% If we use Eq 5 & Eq 6, we get the following:

% cos(11) = cos(15 + (-4)) = cos(15)cos(-4) - sin(15)sin(-4)
% sin(11) = sin(15 + (-4)) = cos(15)sin(-4) + sin(15)cos(-4)

% So, we can find cos(11) and sin(11) by solving for the values on the
% right sides of the equations and plugging them back in. 
% Using Equations 1-4, the values we must solve for are: 
% cos(15), cos(-4), sin(15), & sin(-4).


%Given:
cos_of_60 = 0.5;
cos_of_16 = 0.96126169593;


%Finding cos(15) and cos(-4):

%Use Eq 1
cos_of_30 = sqrt((1 + cos_of_60)/2);
cos_of_15 = sqrt((1 + cos_of_30)/2);       
cos_of_8 = sqrt((1 + cos_of_16)/2);
cos_of_4 = sqrt((1 + cos_of_8)/2);    

%Use Eq 3
cos_of_negative_4 = cos_of_4;              


%Finding sin(15) and sin(-4)

%Use Eq 2
sin_of_15 = sqrt((1 - cos_of_30)/2);
sin_of_4 = sqrt((1 - cos_of_8)/2);

%Use Eq 4
sin_of_negative_4 = -1*(sin_of_4);


%Now plug in the values we found for cos(15), cos(-4), sin(15), and sin(-4)
%into the equations we made previously using Eq 5 and Eq 6

cos_of_11 = (cos_of_15)*(cos_of_negative_4) - ...
    (sin_of_15)*(sin_of_negative_4);

sin_of_11 = (cos_of_15)*(sin_of_negative_4) + ...
    (sin_of_15)*(cos_of_negative_4);

%Printing the values

fprintf('%s %f \n%s %f', 'cos(11) =', cos_of_11, 'sin(11) =', sin_of_11);

