clc;
clear all;
more off;

function y = f(x)
  y = x.^3+9*x+9;
endfunction
function y = deriv_f(x)
  y = 3*x.^2+9;
  endfunction
semillas = linspace(-3, 0, 11);

printf("Aplicaremos Newton Raphson a la funcion f del ejercicio 2\n\n")

printf("Semilla  aproximacion  numero de iteraciones     mensaje\n");

for s = semillas
  [aprox, n, msg] = fNR(@f,@deriv_f,semillas, 10^(-8), 100);
  printf("%14,3f %14.6f %12f %s \n", s, aprox, n, msg);
endfor

