%Neighbor Identification, hw2 p#2
%Prints values for all neighbors of a cell P in an M x N retangular array
%Duncan Di Mauro
%805163177

clc; close all; clear all;

%% Rows M, Columns N, and Cell P inputs/input errors

Rows = input('Enter an integer value for the number of rows, M: ', 's');
Columns = input('Enter an integer value for the number of columns, N: ', 's');

M = str2double(Rows);
N = str2double (Columns);

if M < 3 || N < 3 || mod(M, 1) ~= 0 || mod(N, 1) ~= 0
    error('M or N must be greater than or equal to 3.')
end

P_string = input('Please enter the value of the desired cell, P: ', 's');
P = str2double(P_string);

if P < 1 || P > M*N || mod(P, 1) ~= 0
    error('Invalid Input for P')
end

%% Calculating and Printing Neighbor Cells

%Calculations for Neighbor cells

Neighbor1 = P - M;      %Left of P
Neighbor2 = P + M;      %Right of P
Neighbor3 = P + 1;      %Below P
Neighbor4 = P - 1;      %Above P
Neighbor5 = P - M - 1;  %Upper-Left of P
Neighbor6 = P - M + 1;  %Lower-Left of P
Neighbor7 = P + M - 1;  %Upper-Right of P
Neighbor8 = P + M + 1;  %Lower-Right of P

% Rules to identify if P is a corner or is on a wall:

% P is Upper-Left corner if P = 1
% P is Upper-Right corner if P = M*(N-1) + 1
% P is Lower-Left corner if P = M
% P is Lower-Right corner if P = M*N
% P is against Left Wall if P <= M
% P is against Right Wall if P > M*(N-1)
% P is against Upper Wall if mod(P - 1, M) = 0
% P is against Lower Wall if mod(P, M) = 0


%Printing neighbor cells:

if P == 1                  % If P is the Upper-Left Corner
    fprintf('\n%s%i %i %i', 'Corner node: ', Neighbor3, Neighbor2, Neighbor8)
elseif P == M*(N-1) + 1    % If P is the Upper-Right Corner
    fprintf('\n%s%i %i %i', 'Corner node: ', Neighbor1, Neighbor6, Neighbor3)
elseif P == M              % If P is the Lower-Left Corner
    fprintf('\n%s%i %i %i', 'Corner node: ', Neighbor4, Neighbor7, Neighbor2)
elseif P == M*N            % If P is the Lower-Right Corner
    fprintf('\n%s%i %i %i', 'Corner node: ', Neighbor5, Neighbor1, Neighbor4)
elseif P <= M              % If P is along the Left Wall
    fprintf('\n%i %i %i %i %i', Neighbor4, Neighbor3, Neighbor7, ...
        Neighbor2, Neighbor8)
elseif P > M*(N-1)         % If P is along the Right Wall
    fprintf('\n%i %i %i %i %i', Neighbor5, Neighbor1, Neighbor6, ...
        Neighbor4, Neighbor3)
elseif mod(P - 1, M) == 0  % If P is along the Upper Wall
    fprintf('\n%i %i %i %i %i', Neighbor1, Neighbor6, Neighbor3, ...
        Neighbor2, Neighbor8)
elseif mod(P, M) == 0      % If P is along the Lower Wall
    fprintf('\n%i %i %i %i %i', Neighbor5, Neighbor1, Neighbor4, ...
        Neighbor7, Neighbor2)
else                       % If P is not a corner or against a wall
    fprintf('\n%i %i %i %i %i %i %i %i', Neighbor5, Neighbor1, ...
        Neighbor6, Neighbor4, Neighbor3, Neighbor7, Neighbor2, Neighbor8)
end
