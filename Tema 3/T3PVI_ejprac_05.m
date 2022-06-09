% PVI implícito
clc; clear all; more off;
disp("Ejercicio 5")
function ret = val_ecuac(t, x, x_prima)
    ret = x_prima^2 + t * x - exp(-x_prima) - t;
endfunction

function x_prima = f(t, x, x1)
    x_prima = fsolve(@(u) val_ecuac(t, x, u), x1);
endfunction

a = 0; b = 10; mu = 0; h = 0.1;

x1 = f(a, mu, 0);

N = round((b - a) / h);
t = a * ones(1, N + 1);
x = mu * ones(1, N + 1);

for n = 1:N
    x(n + 1) = x(n) + h * f(t(n), x(n), x1);
    t(n + 1) = t(n) + h;
    x1 = (x(n + 1) - x(n)) / h; # proxima semilla
endfor

waitfor(plot(t, x, ";xn;"));
disp("==== FIN ====")
