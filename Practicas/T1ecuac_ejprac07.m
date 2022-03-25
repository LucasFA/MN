clc; clear all;

function y = f(x)
    y = [4 * x(1)^2 + x(2)^2 - 4; x(1) + x(2) - sin(x(1) - x(2))];
endfunction

% El jacobiano de la f definida aquí ^ encima
function M = J(x)
    M = [8 * x(1), 2 * x(2); 1 - cos(x(1) - x(2)), 1 + cos(x(1) - x(2))];
endfunction

% Inicializamos
nmax = 100;
tol = 10^(-8);
x0 = x1 = [0.5; 0.5];
n = 0;

% Ejecutamos NR
do
    x0 = x1;
    x1 = x0 - J(x0) \ f(x0);
    n++;
until (norm(x1 - x0, 1) < tol || n > nmax)

printf("Se obtiene la solución aproximada (%0.6f,%0.6f) tras %i iteraciones\n", x1(1), x1(2), n)
