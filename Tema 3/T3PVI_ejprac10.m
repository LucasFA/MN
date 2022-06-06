clc; clear all; more off;

h = 0.1;

mu = [0; 0];

function y = sol(t)
    y = 0;
endfunction

a = 0; b = 0.5;
fmt = "%6.2f";
fmx = "%12.8f";
fme = "%12.6e";
formato = [fmt fmx fmx fme fme];

disp("=========================================");
disp("     t      x1     x2    err1      err2");
disp("=========================================");

printf("");
for n = 1:N
    xn = x(:, n);
    fn = f(t(n), xn)
    K1 = fn
    K2 = f(t(n) + h / 2, xn + h / 2 * K1);
    K3 = f(t(n) + h / 2, xn + h / 2 * K2);
    K4 = f(t(n) + h, xn + h * K3);
    t(n + 1) = t(n) + h;
    exacta(:, n + 1) = sol(t(n + 1));
    printf(formato t(n + 1), x(1, n + 1), x(2, n + 1))
endfor
disp("")

figure(1);
plot(x(1, :), x(2, :), ";aprox;", exacta(1, :), exacta(2, :), ";exacta;");

figure(2);
plot(t, x(2, :) - exacta(2, :), ";diferencia1;", t, x(1, :) - exacta(1, :), ";diferencia2;");
hold on
disp("========== FIN ===========")
