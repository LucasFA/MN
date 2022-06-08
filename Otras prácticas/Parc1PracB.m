clc; clear all; more off; hold off;

% Ec de iteracion funcional
function y = g(x)
    y = (exp(-x) + 1 - 8 * x) ./ (2 * (sin(x) + 2));
endfunction

t = linspace(-1, 1, 20);
plot(t, t, 'b;bisectriz;') # azul
hold on;
plot(t, g(t), 'r;g(t);') # rojo
plot(t, zeros(1,20),'--k;t = 0;')
hold off;

disp("Observamos que g tiene una pendiente negativa muy baja: podemos asegurar que |g(x)| < 1 para todo x en un entorno ")
disp("que incluye tanto a la raiz de f como a la semilla x0 = 0.25.")
disp("Por tanto, podemos asegurar la convergencia del metodo de iteracion funcional, recordando el teorema de convergencia global")

% -----------------------------------------------
# Apartado 2
disp("")
disp("Tabla de iteraciones de Steffensen:");
disp("Iteracion   aproximacion   diferencia absoluta");

formato = "%18.8f";
formatoFinal = ["  %2d " formato formato "\n"];

tol = 1e-4;
err = 0;
x = [0 0 0];

xanterior = 0.25;
iteraciones = 0;

printf(formatoFinal, iteraciones, xanterior, err);

do
    x(1) = xanterior;
    for i = 2:3
        x(i) = g(x(i - 1));
    endfor

    # aplicamos Aitken al tercer paso:
    % Si d es la diferencia progresiva, asumida lineal, d(d(x)) == d(x(3) - x(2)) ==
    % == x(3) - x(2) - x(2) + x(1) == x(3) - 2*x(2) + x(1)
    xnueva = x(3) - (x(3) - x(2))^2 / (x(3) - 2 * x(2) + x(1));
    iteraciones++;
    err = abs(xnueva - xanterior);

    printf(formatoFinal, iteraciones, xnueva, err)

    xanterior = xnueva;
until (err < tol || iteraciones > 1000)
% El criterio de parada por iteraciones no esta pedido, pero es una medida de seguridad
