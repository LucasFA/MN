clc; clear all;
disp("EJERCICIO 3")
TOL = 1e-4;
function y = f(x)
    y = x .* exp(-x / 3);
endfunction

a = 0; b = 3;
exacto = quad(@f, a, b)

disp("   Formula      n    eval         aprox          error")
disp("---------------------------------------------------------")
formato = "%11s    %2d    %3d    %14.8f    %10.2e\n";

# ------------------------------------------

% NC

n = 0;
do
    n++;
    h = (b - a) / n;
    s = 0;
    for i = 1:n
        [nodos pesos] = integralNC(a + (i - 1) * h, a + i * h, 4, false, false);
        s = s + pesos * f(nodos)';
    endfor
until abs(s - exacto) < TOL;

printf(formato, "NewtonCotes", n, n * 3, s, abs(s - exacto))

# ------------------------------------------
% Simpson
n = 1;
do
    n++; h = (b - a) / n;
    s4 = sum(f(linspace(a + h / 2, b - h / 2, n))); # nodos de en medio (ponderados por 4/6)
    s2 = sum(f(linspace(a + h, b - h, n - 1))); # nodos de enlace

    s = h / 6 * (f(a) + 4 * s4 + 2 * s2 + f(b));

until abs(s - exacto) < TOL;

printf(formato, "Simpson", n, 2 * n + 1, s, abs(s - exacto))
# ------------------------------------------
% trapecio
n = 1;
do
    n++; h = (b - a) / n;
    s = h / 2 * (f(a) + 2 * sum(f(linspace(a + h, b - h, n - 1))) + f(b));
until abs(s - exacto) < TOL;

printf(formato, "Trapecio", n, n + 1, s, abs(s - exacto))

disp("=========================================================")
disp("FINAL DEL EJERCICIO")
disp("Observamos que trapecio no es eficiente")
disp("Newton Cotes tiene buen rendimiento, aunque es algo complicada")
disp("Simpson es mas sencilla y es muy eficiente")
