clc; 
clear;

%% Inputs
% First two columns in the divided differences table.
% x_i
x = [5;
     6;
     9; 
     11];
 
% f(x_i)
y = [12; 
     13; 
     14; 
     16];
 
%% Output
% Initializing divided differences table
ddTable = [x y];

% Calling the function
ddTable = dd(ddTable, x, y)

%% Function definition
 function ddTable = dd(A, x, y)
    n = length(x);
    m = length(y);  
    p = n - m; % Length difference
    d = [];    % New column in the divided differences table
    if m ~= 1
        % Creating new column in the divided differences table
        for i = 1:(m - 1)
            dy = y(i+1) - y(i);
            dx = x(i+1+p) - x(i);
            d = [d; dy/dx];
        end
        daux = [d; zeros(p + 1 , 1)]; % Auxiliary column vector so that d 
                                      % can be appended to A
        A = [A daux]; % Update divided differences table
        % Recursion
        ddTable = dd(A, x, d);
    else % Terminating case
        ddTable = A;
    end
 end