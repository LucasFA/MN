clc;
clear all;
more off;

function y = f(x)
    y = x.^3 + 9 * x + 9;
endfunction

function y = deriv_f(x)
    y = 3 * x.^2 + 9;
endfunction

printf("Aplicaremos el metodo de la secante a la funcion f del ejercicio 2\n\n")

printf("Semilla  aproximacion  iteraciones     mensaje\n");

semillas = linspace(-3, -0.3, 10);

for s = semillas
    [aprox, n, msg] = fSecante(@f, s, s + 0.01, 10^(-5), 100);
    printf("%.2f  %14.9f  %7i       %s \n", s, aprox, n, msg);
endfor
