#   TODO: eliminar cálculos redundantes de s.

clc;
function y = f(t, x)
    y = x - t^2 + 1;
endfunction

a = 0; mu = 0.5; b = 2;

function z = Euler(t, x, h)
    z = x + h * f(t, x);
endfunction

function y = PtoMedio(t, x, h)
    y = x + h * f(t + h / 2, x + h / 2 * f(t, x));
endfunction

# Solucion exacta, calculada a parte
function z = s(t)
    z = (t + 1).^2 - 0.5 * exp(t);
endfunction

t = a; x = mu; N = 80; h = (b - a) / N; # 0.025 para Euler

for n = 1:N
    x = [x Euler(t(end), x(end), h)];
    t = [t t(end) + h];
endfor

tEu = t; xEu = x; sEu = s(t);

# Por que cambiamos el paso? Para que el numero de calculos de f sea el mismo
# para los dos metodos

t = a; x = mu; N = 40; h = (b - a) / N; # 0.05 para PtoMedio
for i = 1:N
    x = [x PtoMedio(t(end), x(end), h)];
    t = [t t(end) + h];
endfor

tPm = t; xPm = x; sPm = s(t);

x = linspace(a, b, 60);
figure(1);

plot(tEu, xEu, "g;Euler;", tPm, xPm, "b;PtoMedio;", x, s(x), "k;Exacta;");
plot(tEu, xEu - s(tEu), "b;Euler;", tPm, xPm - s(tPm), "r;PtoMedio;");

disp("De la segunda grafica se deduce que el punto medio es mas exacta");
disp("========================FIN========================")
