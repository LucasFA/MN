clc; clear all; more off;
function x1 = f(t, x)
    x1 = [
        x(1) - t * x(2) + sin(3 * t)
        2 * x(1) + x(2) - t
    ]';
endfunction

x0 = [5, -1]; a = 0; b = 3;
h = 0.25; N = (b - a) / h;

t = linspace(a, b, N + 1);

x(1, :) = x0;

for n = 1:N
    x(n + 1, :) = x(n, :) + h * f(t(n), x(n, :));
endfor

plot(x(:, 1), x(:, 2), "b;Euler;", "linewidth", 3);
# abcisas primera columna, ordenas segunda columna

# ----------------
# RK4

x(1, :) = x0;

for n = 1:N
    K1 = f(t(n), x(n, :));
    K2 = f(t(n) + h / 2, x(n, :) + h / 2 * K1);
    K3 = f(t(n) + h / 2, x(n, :) + h / 2 * K2);
    K4 = f(t(n) + h, x(n, :) + h * K3);
    x(n + 1, :) = x(n, :) + h / 6 * (K1 + 2 * K2 + 2 * K3 + K4);
endfor

hold on;
h = plot(x(:, 1), x(:, 2), "r;RK4;", "linewidth", 3);
disp("Son muy diferentes. Euler tendra un error muy grande");
disp("=============FIN=============");
waitfor(h);
