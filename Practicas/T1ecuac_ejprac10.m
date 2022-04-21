clc; clear all; more off;

disp("Ejercicio prácticos-- ecuaciones")

function y = f(x)
    y = exp(x / 4) + cos(pi * x) - 1.5;
endfunction

function [m n] = triseccion(a, b, tol)
    fa = f(a);
    fb = f(b);
    n = 0;
    do
        n++;
        m1 = (2 * a + b) / 3;
        m2 = (a + 2 * b) / 3;
        fm1 = f(m1);
        if (fa * fm1 < 0) # tercio izquierdo
            b = m1; fb = fm1;
            continue # esto es un goto do, al principio del bucle. Al final del archivo está la version "original"
        endif
        # los otros 2 tercios
        fm2 = f(m2);
        if (fm2 * fb < 0) # tercio derecho
            a = m2; fa = fm2;
            continue
        endif
        # tercio central, por descarte
        a = m1; fa = fm1;
        b = m2; fb = fm2;

    until b - a <= 2 * tol;
    m = (a + b) / 2;
endfunction

figure(1);
x = linspace(0, 6, 100);

y = f(x);
plot(x, y, [0 6], [0 0], "k")

nodos = [0 1 2 3 4];
for i = 2:length(nodos)
    [m n] = triseccion(nodos(i - 1), nodos(i), 1e-8);
    printf("Raiz %14.8f en %d iteraciones\n", m, n);
endfor

disp("FIN DEL EJERCICIO")

% do
%     n++;
%     m1 = (2 * a + b) / 3;
%     m2 = (a + 2 * b) / 3;
%     fm1 = f(m1);
%     if (fa * fm1 < 0) # tercio izquierdo
%         b = m1; fb = fm1;
%     else
%         # los otros 2 tercios
%         fm2 = f(m2);
%         if (fm2 * fb < 0) # tercio derecho
%             a = m2; fa = fm2;
%         else
%             # tercio central, por descarte
%             a = m1; fa = fm1;
%             b = m2; fb = fm2;
%         endif
%     endif
% until b - a <= 2 * tol;
