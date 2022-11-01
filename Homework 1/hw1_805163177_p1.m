% I love M20, Homework 1 Problem #1
% Altering and combining two strings to print "I love M20"
% Duncan Di Mauro
% 805163177

clc; close all; clear all;

%Prompts for two strings

String1 = input('String 1: ','s');
String2 = input('String 2: ', 's');

%flipping String2

flippedString2 = fliplr(String2);

%Printing the two strings

fprintf('%s %s', String1, flippedString2);
