clc; clear all; more off;

function y = f(t, x)
    y = 0.05 * x * (1 - log(x));
endfunction

ah = [20 0.25];

a = 0; b = 100; mu = 1;

% vers con Butchersemi
Ba = [0 0; 2/3 0];
Bb = [1/4 3/4];
Bc = [0 2/3];
hold on
for h = ah
    N = round((b - a) / h);
    t = a * ones(1, N + 1);
    x = mu * ones(1, N + 1);

    for n = 1:N
        [t(n + 1) x(n + 1)] = ButcherSemi(Ba, Bb, Bc, t(n), x(n), h);
    endfor

    plot(t, x, [";h = " num2str(h) ";"]);
endfor

hold off;
disp("======================")
