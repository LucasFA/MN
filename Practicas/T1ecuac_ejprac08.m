clc; clear all; more off;

function y = f(x)
    y = 1 - x +0.3 * cos(x);
endfunction

function x3 = Muller(f, x0, x1, x2)
    f0 = f(x0);
    f1 = f(x1);
    f2 = f(x2);

    d0 = (f1 - f0) / (x1 - x0);
    d1 = (f2 - f1) / (x2 - x1);
    a = (d1 - d0) / (x2 - x0);
    b = d0 - a * (x0 + x1);
    c = f0 - x0 * d0 + a * x0 * x1;
	# No es así
    x3 = x2 - (a * x2^2 + b * x2 +c) / (2 * a * x2 + b);
endfunction

% Apartado b
x = [1.3, 1.4, 1.5];
numero_iteraciones = 6;

for n = 4:(3 + numero_iteraciones)
    x(n) = Muller(@f, x(n - 3), x(n - 2), x(n - 1));
endfor

printf("Tabla:\n");
printf("n   aprox\n");
for n = 1:(numero_iteraciones + 3)
    printf("%i  %.8f\n", n, x(n));
endfor
