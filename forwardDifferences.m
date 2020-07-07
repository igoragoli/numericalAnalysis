clc; 
clear;

%% Inputs
% First two columns in the forward differences table.
% x_i
x0 = -1; % x_0, the smallest x used in the interpolation
h = 0.5; % Step size
n = 7;   % Number of points used in the interpolation
x = [x0];
for i = 1:(n - 1)
    x = [x; x0 + h * i];
end

% f(x_i)
y = [4; 
     1; 
     8; 
     4;
     -15;
     -37;
     -32];
 
% Divided differences table
fdTable = [x y];

%% Output
% Calling the function
fdTable = fd(fdTable, x, y)

%% Function definition
 function fdTable = fd(A, x, y)
    n = length(x);
    m = length(y);  
    p = n - m; % Length difference
    d = [];    % New column in the forward differences table
    if m ~= 1
        % Creating new column in the forward differences table
        for i = 1:(m - 1)
            dy = y(i+1) - y(i);
            d = [d; dy];
        end
        daux = [d; zeros(p + 1 , 1)]; % Auxiliary column vector so that d 
                                      % can be appended to A
        A = [A daux]; % Update forward differences table
        % Recursion
        fdTable = fd(A, x, d);
    else % Terminating case
        fdTable = A;
    end
 end