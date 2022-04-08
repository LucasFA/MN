clc; clear all; more off;
function y = f(x)
    y(1) = sin(x(1) * x(2)) / 2 - x(2) / (4 * pi) - x(1) / 2;
    y(2) = (1 - 1 / (4 * pi)) * (exp(2 * x(1)) - e) + (e / pi) * x(2) - 2 * e * x(1);
    y = y';
endfunction

tol = 10^(-8);
function J = J(x)
    J = [
        cos(x(1) * x(2)) * x(2) / 2 - 1/2, cos(x(1) * x(2)) * x(1) / 2 - 1 / (4 * pi);
        (1 - 1 / (4 * pi)) * exp(2 * x(1)) * 2 - 2 * e, e / pi
        ];
endfunction

tol = 1e-5;
semillas = [linspace(-2, 2, 5); linspace(-2, 2, 5)]'
% figure(1); clf; hold on;
for s = 1:rows(semillas)
    x0 = semillas(s, :)';
    printf("Desde [%5.2f, %5.2f] ", x0)
    x1 = x0;
    n = 0;
    do
        n++;
        x0 = x1;
        x1 = x0 - J(x0) \ f(x0);
        % plot([x0(1) ...])
    until (norm(x1 - x0, "inf") / norm(x1, "inf") < tol)
    printf("en %2d iteraciones se obtuvo [%18.14f %18.14f]\n", n, x1);
endfor

% plot([x1(1 semillas(s, 1))], [x1(2) semillas(s, 2)], );
% plot(x1(1), x1(2));

disp("FIN DE EJERCICIO")
