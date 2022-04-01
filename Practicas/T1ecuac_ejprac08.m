clc; clear all; more off;

function y = f(x)
    y = 1 - x +0.3 * cos(x);
endfunction

function y = f1(x)
    y = -1 -0.3 * sin(x);
endfunction

function y = f2(x)
    y = -0.3 * cos(x);
endfunction

function x1 = NR2(x0, f, f1, f2)
    x1 = 0;
    fu0 = f(x0);
    fu1 = f1(x0);
    fu2 = f2(x0);

    discr = sqrt(fu1^2 - 2 * fu0 * fu2);
    h1 = (-fu1 + discr) / fu2; # raices h = x1 - x0
    h2 = (-fu1 - discr) / fu2;
    if (abs(h1) < abs(h2))
        y = x0 + h1;
    else
        y = x0 + h2;
    endif
    x1 = y;
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
