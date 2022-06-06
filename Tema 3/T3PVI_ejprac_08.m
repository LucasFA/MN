clc; clear all;

function y = f(t, x)
    y = [
        x(1) * (2 - 0.05 * x(1) - x(2) / 3)
        x(2) * (-2 + 0.5 * x(1))
        ];
endfunction

mu = [2; 1];
a = 0; b = 25;
h = 0.1;

N = round((b - a) / h);

t = a * ones(1, N + 1);
x = [
    mu(1, 1) * ones(1, N + 1)
    mu(2, 1) * ones(1, N + 1)
    ];

for n = 1:N
    xn = x(:, n);
    fn = f(t(n), xn);
    x(:, n + 1) = xn + h / 4 * (fn + 3 * f(t(n) + 2/3 * h, xn + 2/3 * h * fn));
    t(n + 1) = t(n) + h;
endfor

figure(1); clf;
plot(t, x(1, :), [";Poblacion x;"], t, x(2, :), [";Poblacion y;"]);
title("Dinamica de poblaciones");
xlabel("Tiempo t");
ylabel("Poblaciones x, y");

figure(2); clf;
plot(x(1, :), x(2, :));

title("Curva de interaccion entre especies");
xlabel("Poblacion x");
ylabel("Poblacion y");
