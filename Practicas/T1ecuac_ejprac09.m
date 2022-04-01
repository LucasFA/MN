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
    # p(x) = ax^2 + bx + c = fu2 / 2 * x^2 + f1 * x + f0 la par�bola que interpola f(x0) f'(x0) y f''(x0)
    discr = sqrt(fu1^2 - 2 * fu0 * fu2); # bueno, el discriminante ser�a lo de dentro de la ra�z
    h1 = (-fu1 + discr) / fu2; # x + h1, x + h2 son las ra�ces de la par�bola
    h2 = (-fu1 - discr) / fu2;
    if (abs(h1) < abs(h2)) # tomamos la ra�z m�s cercana a x0
        x1 = x0 + h1;
    else
        x1 = x0 + h2;
    endif
endfunction

numero_iteraciones = 6;
x0 = x1 = 1.5;
disp("n        NR2");
for n = 0:numero_iteraciones
    printf("%i  %16.12f\n", n, x1);
    x1 = NR2(x0);
    x0 = x1;
endfor
