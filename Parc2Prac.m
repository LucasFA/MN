clc; clear all; more off;

a = 1; b = 3;
x1 = 4 - e / 2;

function x_prima = f(t, x)
    x_prima = x - t.^2 + 1;
endfunction

function x = solucion_exacta(t)
    x = (t + 1).^2 - e.^t / 2;
endfunction

% --------------------------------------------------------------------------------

% Apartado 1
% Tramo 1
h = 0.1;
a = 1; b = 2;
t1 = a:h:b;

% Tramo 2
h = 0.05;
a = 2; b = 3;
t2 = (a + h):h:b;
t = [t1 t2];
N = length(t);

figure(1); clf;
valores_exacta = solucion_exacta(t);
plot(t, valores_exacta, ";exacta;");
hold on;

% --------------------------------------------------------------------------------
% Apartado 2

% Euler implícito
tolerancia = 1e-5;
function x1 = EulerImpl(t, x, h, tol)
    x0 = x + h * f(t, x);
    x1 = x0;

    do
        x0 = x1;
        x1 = x + h * f(t + h, x0);
    until (abs(x1 - x0) < tol);

endfunction

function x1 = RK4(t, x, h)
    K1 = f(t, x);
    K2 = f(t + h / 2, x + h / 2 * K1);
    K3 = f(t + h / 2, x + h / 2 * K2);
    K4 = f(t + h, x + h * K3);

    x1 = x + h * (K1 + 2 * K2 + 2 * K3 + K4) / 6;
endfunction

h = 0.1;
aprox = x1 * ones(1, length(t));
for n = 2:length(t1)
    aprox(n) = EulerImpl(t(n - 1), aprox(n - 1), h, tolerancia);
endfor

h = 0.05;
for n = (1 + length(t1)):(length(t1) + length(t2))
    aprox(n) = RK4(t(n - 1), aprox(n - 1), h);
endfor

plot(t, aprox, ";aproximada;")

% --------------------------------------------------------------------------------
% Apartado 3
figure(2); clf;
d = zeros(1, length(aprox));

% Formula centrada
for i = 2:(length(aprox) - 1)
    d(i) = (aprox(i + 1) - aprox(i - 1)) / (t(i + 1) - t(i - 1));

endfor

% Los casos excepcionales indicados:
d(1) = (aprox(2) - aprox(1)) / (t(2) - t(1));
% t = 2 es t(11)
d(11) = (aprox(12) - aprox(11)) / (t(12) - t(11)) * 1/2 + 1/2 * (aprox(11) - aprox(10)) / (t(11) - t(10));
d(end) = (aprox(end) - aprox(end - 1)) / (t(end) - t(end - 1));

plot(t, d, "r;derivada aprox;", t, f(t, solucion_exacta(t)), "b;derivada exacta;")

% --------------------------------------------------------------------------------

% Apartado 4

% Aproximacion por trapecio compuesta:

% toma los valores en el eje y para usar para aproximar el area de la integral
function area = trapecio_simple(t, indice_inicial, valores)
    b = t(indice_inicial + 1);
    a = t(indice_inicial);
    base = b - a;

    altura = valores(indice_inicial) + valores(indice_inicial + 1);
    altura /= 2;

    area = base * altura;
endfunction


% Aproximacion usando valores de la solucion aproximados:

areas_aprox = zeros(1, length(t) - 1);
for indice = 1:(length(t) - 1)
    areas_aprox(indice) = trapecio_simple(t, indice, aprox);
endfor
areaaprox = sum(areas_aprox);


% Ahora usando los valores exactos de la solucion

areas_exactas = zeros(1, length(t) - 1);
for indice = 1:(length(t) - 1)
    areas_exactas(indice) = trapecio_simple(t, indice, valores_exacta);
endfor
areaexacta = sum(areas_exactas);

integral_exacta = quad(@solucion_exacta, 1, 3);

fmtfloat = "%18.8f";
disp("Integral aproximada desde:")
disp("Metodo                        aproximacion de la integral      error")
disp("--------------------------------------------------------------------")
printf(["Trapecio de solucion aproximada  " fmtfloat fmtfloat "\n"], areaaprox,       areaaprox - integral_exacta);
printf(["Trapecio de solucion exacta      " fmtfloat fmtfloat "\n"], areaexacta,      areaexacta - integral_exacta);
printf(["Exacta (usando quad)             " fmtfloat fmtfloat "\n"], integral_exacta, 0);