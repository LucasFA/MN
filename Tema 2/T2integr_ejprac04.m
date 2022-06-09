% Romberg
clc; clear all;
disp("EJERCICIO 4")

TOL = 1e-4;
function y = f(x)
    y = x .* exp(-x / 3);
endfunction

disp("    N  iter      aprox       criterio")
a = 0; b = 3;
exacto = quad(@f, a, b);

function N = tablaRomberg(a, b, MaxIter, tol)
    formato = "   %d  %3d  %12.8f  %12.8f\n";
    N = 1; n = 1; h = b - a;
    R(1, 1) = h / 2 * (f(a) + f(b));
    printf(formato, 0, 1, R(1, 1), 0);
    do
        x = linspace(a + h / 2, b - h / 2, n);
        R(N + 1, 1) = 1/2 * (R(N, 1) + h * sum(f(x)));
        N++;
        n = 2 * n;
        h = h / 2;
        for k = 2:N
            coef = 4^(k - 1);
            R(N, k) = (coef * R(N, k - 1) - R(N - 1, k - 1)) / (coef - 1);
        endfor
        printf(formato, N, 2^N, R(N, N), abs(R(N - 1, N - 1) - R(N, N)))
    until abs(R(N - 1, N - 1) - R(N, N)) < tol || N > MaxIter;
endfunction

tablaRomberg(a, b, 100, TOL);
