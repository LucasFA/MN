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

    discr = sqrt(b^2 - 4 * a * c);

    r1 = (-b + discr) / (2 * a);
    r2 = (-b - discr) / (2 * a);

    dif1 = abs(r1 - x2);
    dif2 = abs(r2 - x2);
    if (dif1 < dif2)
        x3 = r1;
    else
        x3 = r2;
    endif
endfunction

# Apartado b
x = [1.3, 1.4, 1.5];
x0 = x(1); x1 = x(2); x2 = x(3);
numero_iteraciones = 15;
x_muller = x;
x_NR2 = x;
for n = 4:(3 + numero_iteraciones)
    x_muller(n) = Muller(@f, x_muller(n - 3), x_muller(n - 2), x_muller(n - 1));
    x_NR2(n) = NR2(x_NR2(n - 1));
endfor


formato = '%12.8f'
printf("Tabla:\n");
disp('===========================================')
printf(" n |    Muller        NR2\n");
disp("----------------------------")

for n = 1:2
    printf(["%2i |" formato "\n"], n, x_muller(n));
endfor
for n = 3:(numero_iteraciones + 3)
    printf(["%2i |" formato formato "\n"], n, x_muller(n), x_NR2(n))
endfor

disp('===========================================')
disp("==== FIN DEL EJERCICIO ====")