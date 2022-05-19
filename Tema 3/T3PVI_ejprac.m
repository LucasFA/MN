clc; clear all; more off;

% Ec diferencial: v' = -g - k/m * v*abs(v)
function y = f(t, x)
    m = 0.11;
    v0 = 30;
    g = 9.8;
    k = 0.002;
    y = -g - k / m * x * abs(x) / m;
endfunction

a = 0;
mu = 10;
tol = 1e-6;
h = 0.2;

function y = Euler(t, x, h)
    y = x + h * f(t, x);
endfunction

function x1 = EulerImpl(t, x, h, tol)
    x0 = Euler(t, x, h);
    x1 = x0;

    do
        x0 = x1;
        x1 = x + h * f(t + h, x0);
    until (abs(x1 - x0) < tol);
endfunction

function z = Heun(t, x, h)
    v = f(t, x);
    z = x + h / 2 * (v + f(t + h, x + h * v));
endfunction

function z = RK2(t, x, h)
    RK1 = f(t, x);
    RK2 = f(t + 2/5 * h, x + 2/5 * h * RK1);
    z = x + h * (-RK1 / 4 + 5/4 * RK2);
endfunction

t0 = a;
x0 = ones(4, 1) * mu;
s0 = zeros(4, 1);

disp("Ejercicio 1")
fmt = "%6.2f";
formatoFinal = ["%2d %4.2f" " |" fmt fmt " |" fmt fmt " |" fmt fmt " |" fmt fmt "\n"];
disp("        |    Euler    | Eulerimpl   |    Heun     |     RK2")
disp(" n   t  |   v      h  |   v     h   |   v     h   |   v     h  ")
disp("-----------------------------------------------------------------")

t1 = t0; x1 = x0; s1 = s0; n = 0;

do
    printf(formatoFinal, n, t1, [x1, s1]');
    n++; t0 = t1; x0 = x1; s0 = s1;
    x1 = [
        Euler(t0, x0(1), h)
        EulerImpl(t0, x0(2), h, tol)
        Heun(t0, x0(3), h)
        RK2(t0, x0(4), h)
        ];
    s1 = s0 + h / 2 * (x0 + x1);
    t1 = t0 + h;
until (max(s1) <= 0);

printf(formatoFinal, n, t1, [x1 s1]);
# Ultima fila ^

printf("Altura max: ")
printf("Tiempo estimado de impacto; ")

disp("¿Difiere algun metodo de los demas?")
