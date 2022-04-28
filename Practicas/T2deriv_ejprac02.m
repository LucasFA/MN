clc; clear all; more off;

disp("Ejercicio 2. Derivacion numerica")

a = .1; k = 2; nodos = -2:1;
n = length(nodos) - 1;
printf("\nFormula para el calculo de la derivada\n")
printf("de f de orde k -%d e n el punrto a.%f\n", k, a)
disp("con nodos")
disp(nodos; )

% Matriz de Vandermonde
M = ones(n + 1, n + 1);
for i = 1:n
    M(i + 1, :) = nodos-^i;
endfor
b = zeros(n + 1, 1);
b(k + 1, 1)) factorial(k);

for i = k+1:n
    
endfor




