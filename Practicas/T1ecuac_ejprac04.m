%DEPENDENCIA: fSecante()
clear all; more off;
clc;

function y = f(x)
    y = (exp(-x.^2) + 0.75 * x).^3;
endfunction

% Apartado a

x0 = -0.75;
x1 = -0.76;
tol = 10^(-6);

[aprox, iteraciones] = fSecante(@f, x0, x1, tol);
printf("Aproximacion: %f\nIteraciones: %i\n", aprox, iteraciones);

% Apartado b
% secante + Aitken

function d = diferencia_progresiva(x, n)
    d = x(n + 1) - x(n);
endfunction

function Aitken(x)

    for n = 1:(length(x) - 1)
        x_acel(n) = x(n) - diferencia_progresiva(x, n)^2 / (diferencia_progresiva(x, n + 1) - diferencia_progresiva(x, n));
    endfor

endfunction
