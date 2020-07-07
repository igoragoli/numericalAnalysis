% Input
A = [6,-1,1;2,-5,1;2,1,2];
b = [-0.0001;-0.0005;0.0011];
eps = 1e-9;
n = length(A);
x0 = zeros(n,1);

% Creating D, L and U.
D = diag(diag(A));
L = - (tril(A) - D);
U = - (triu(A) - D);

% Jacobi
fprintf("Jacobi Method\n");
Tj = D \ (L + U);
cj = D \ b;

xk = x0;
error = 1;

k = 0;
while error > eps
    fprintf("k = %i  -  x%i = [", k, k);
    for i=1:n
        fprintf("%.3f ", xk(i));
    end
    fprintf("\b]\n");
    xk1 = Tj*xk + cj;
    if max(abs(xk1)) == 0 
        if max(abs(xk0)) == 0
            error = 0;
        else
            error = 1;
        end
    else
        error = max(abs(xk1 - xk))/max(abs(xk1));
    end
    xk = xk1;
    k = k + 1;
end


% Gauss
fprintf("\n\n");
fprintf("G-S Method\n");
Tg = (D - L) \ U;
cg = (D - L) \ b;

xk = x0;
error = 1;

k = 0;
while error > eps
    fprintf("k = %i  -  x%i = [", k, k);
    for i=1:n
        fprintf("%.3f ", xk(i));
    end
    fprintf("\b]\n");
    xk1 = Tg*xk + cg;
    if max(abs(xk1)) == 0 
        if max(abs(xk0)) == 0
            error = 0;
        else
            error = 1;
        end
    else
        error = max(abs(xk1 - xk))/max(abs(xk1));
    end
    xk = xk1;
    k = k + 1;
end

