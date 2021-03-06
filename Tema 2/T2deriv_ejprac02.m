clc; clear all; more off;
% Interpolatorio cl?sico
disp("Ejercicio 2. Derivacion numerica")

a = -1; k = 2; nodos = -2:1;
n = length(nodos) - 1;
printf("\nFormula para el calculo de la derivada\n")
printf("de f de orden k = %d en el punto a = %f\n", k, a)
disp("con nodos")
disp(nodos);

% Matriz de Vandermonde
M = ones(n + 1, n + 1);
for i = 1:n
    M(i + 1, :) = nodos.^i;
endfor
% terminos independientes
b = zeros(n + 1, 1);
b(k + 1, 1) = factorial(k); # (evitar posible 0^0)

for i = k+1:n
    b(i + 1, 1) = factorial(i) * a^(i - k) / factorial(i - k);
endfor

disp("Matriz de Vandermonde y de terminos independientes:")
disp([M b])

alpha = M\b;

printf("Pesos:\n")
disp(alpha);
# CHecked output for a): it's alright

% apartado b
clear all;
a = 1;
k = 1;
nodos = [-1 -0.5 0 1];

n = length(nodos) - 1
printf("\nFormula para el calculo de la derivada\n")
printf("de f de orden k = %d en el punto a = %f\n", k, a)
disp("con nodos")
disp(nodos);

M = ones(n + 1, n + 1);
for i = 1:n
    M(i + 1, :) = nodos.^i;
endfor

b = zeros(n + 1, 1);

for i = k:n
    b(i + 1, 1) = factorial(i) * a^(i - k) / factorial(i - k);
endfor

disp("Matriz de Vandermonde y de terminos independientes:")
disp([M b])

alpha = M \ b;

printf("Pesos:\n")
disp(alpha);
