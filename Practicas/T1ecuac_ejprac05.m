clc;
clear all;
more off;

function y = f(x)
    y = x.^3 + 9 * x + 9;
endfunction

function y = deriv_f(x)
    y = 3 * x.^2 + 9;
endfunction


printf("Aplicaremos Newton Raphson a la funcion f del ejercicio 2\n\n")

printf("Semilla      Aproximacion     Iteraciones       Mensaje\n");

semillas = linspace(-3, 0, 11);
for s = semillas
    [aprox, n, msg] = fNewtonRaphson(@f, @deriv_f, s, 10^(-8), 100);
    printf("% 4.2f %21.14f %8i    %30s \n", s, aprox, n, msg);
endfor
