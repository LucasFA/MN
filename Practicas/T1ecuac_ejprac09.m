clc; clear all; more off;
function y = f(x)
    y = 1 - x + 0.3 * cos(x);
endfunction

function y = f1(x)
    y = -1 -0.3 * sin(x);
endfunction

function y = f2(x)
    y = -0.3 * cos(x);
endfunction

function x1 = NR2(x0)
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

numero_iteraciones = 6;
x0 = x1 = 1.5;
disp("n        NR2");
for n = 1:numero_iteraciones
    printf("%i  %16.12f\n", n, x1);
    x1 = NR2(x0);
    x0 = x1;
endfor
