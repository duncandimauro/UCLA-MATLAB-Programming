%Input Date Return Day of Week, hw2 p#1
%Takes a calendar date as an input and prints the day of the week
%Duncan Di Mauro
%805163177

clc; close all; clear all;

%% Month, Year, and Day inputs/input errors

%Check that year is numerical and is within bounds 

year = input('Please enter the year as YYYY (e.g. 2008): ', 's');
year_value = str2double(year);
if (length(year) ~= 4 || mod(year_value, 1) ~= 0)
    error('Invalid Input')
elseif year_value < 1 || year_value > 9999
    error('Invalid Input')
end

%Check that Month and Day are inputted properly, and Day is within bounds 

month = upper(input('Please enter the month as MMM (e.g. FEB): ', 's'));

switch month 
    case 'JAN'
        month_value = 1;
        final_day = 31;
    case 'FEB'
        month_value = 2;
        %Leap year rules
        if mod(year_value, 4) == 0 && (mod(year_value, 400) == 0 || ...
                mod(year_value, 100) ~= 0)
            final_day = 29;
        else
            final_day = 28;
        end
    case 'MAR'
        month_value = 3;
        final_day = 31;
    case 'APR'
        month_value = 4;
        final_day = 30;
    case 'MAY'
        month_value = 5;
        final_day = 31;
    case 'JUN'
        month_value = 6;
        final_day = 30;
    case 'JUL'
        month_value = 7;
        final_day = 31;
    case 'AUG'
        month_value = 8;
        final_day = 31;
    case 'SEP'
        month_value = 9;
        final_day = 30;
    case 'OCT'
        month_value = 10;
        final_day = 31;
    case 'NOV'
        month_value = 11;
        final_day = 30;
    case 'DEC' 
        month_value = 12;
        final_day = 31;
    otherwise
        error('Invalid Input');
end

day = input('Please enter the day as DD (e.g. 06): ', 's');
day_value = str2double(day);

if (day_value < 1 || day_value > final_day)
    error ('Invalid Input')
elseif (length(day) ~=2 || mod(day_value, 1) ~= 0)
    error ('Invalid Input')
end

%% Computing day of the week using the Gaussian Algorithm

% From Homework 2:
% w = [d + floor(2.6*m - 0.2) + y + floor(y/4) + floor(c/4) - 2*c) mod 7
% w: Day of the week (0 is Sunday, 6 is Saturday).
% d: Day of the month.
% m: Shifted month calculated as ((month + 9) mod 12) + 1.
% y: Last 2 digits of the year.
% c: First 2 digits of the year.

year_updated = year_value;
%Account for January and February (as required by algorithm)
if (month_value == 1 || month_value == 2)
    year_updated = year_updated - 1;
end

d = day_value;
m = mod((month_value + 9), 12) + 1;
c = floor(year_updated/100); 
y = year_updated - (c*100);

%Calculate w using formula
w = mod((d + floor(2.6*m - 0.2) + y + floor(y/4) + floor(c/4) - 2.*c), 7);

%% Printing

if w == 0 
    fprintf('\n%s %s %s %s \n%s', month, day, year, ...
        'is a Sunday.', 'Yay, it is a weekend!.');
elseif w == 1
    fprintf('\n%s %s %s %s', month, day, year, 'is a Monday.')
elseif w == 2
    fprintf('\n%s %s %s %s', month, day, year, 'is a Tuesday.')
elseif w == 3
    fprintf('\n%s %s %s %s', month, day, year, 'is a Wednesday.')
elseif w == 4
    fprintf('\n%s %s %s %s', month, day, year, 'is a Thursday.')
elseif w == 5
    fprintf('\n%s %s %s %s', month, day, year, 'is a Friday.')
elseif w == 6
    fprintf('\n%s %s %s %s \n%s', month, day, year, ...
        'is a Saturday.', 'Yay, it is a weekend!.');
end