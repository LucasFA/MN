clc; clear all; more off;
% Centrada 3 nodos
function y = f(x)
    y = x.^3;
endfunction

a = 1; # nodo

disp("Ejercicio 1")
disp("k        h        numerador  aproximacion   error")
disp("--------------------------------")

formatofloat = "%12.8f";

for k = 1:20
    h = 10^(-k);
    numerador = f(a + h) - f(a - h);
    aprox = numerador / (2 * h);
    err = 0;
    printf(["%2d " formatofloat " " formatofloat " " formatofloat " " formatofloat "\n"], k, h, numerador, aprox, err)
endfor
disp("Nota: observe los errores de truncatura de computacion para h pequeno")
