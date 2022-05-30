clc; clear all; more off;

hvals = [2, 1, 0.5, 0.25];
x0 = mu = 5;
a = 0; b = 10;

function y = f(t, x)
    y = -x + sin(2 * t);
endfunction

Butcher_a = [0 0; 0 1]; # aij
Butcher_b = [1/2 1/2]; # peso combinar Ki
Butcher_c = [0 1]; # paso

disp("Arreglo de Butcher:")
disp([Butcher_c' Butcher_a; 0 Butcher_b]);

figure(1); clf; hold on;

for h = hvals
    N = (b - a) / h;
    t = a * ones(1, N + 1);
    x = mu * ones(1, N + 1);
    for n = 1:N
        [t(n + 1) x(n + 1)] = ButcherSemi(Butcher_a, Butcher_b, Butcher_c, t,x, h);
    endfor
    plot(t, x, [";h=" num2str(h) ";"]);
endfor

hold off;
disp("============= FIN DE EJERCICIO =============")
