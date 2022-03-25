clc;
clear all;
more off;

function y = f(x)
    y = x.^3 + 9 * x + 9;
endfunction

function y = g1(x)
    y = -x.^3/9 - 1;
endfunction

function y = g2(x)
    y = -9 ./ (x.^2 + 9);
endfunction

function y = g3(x)
    y = x.^3 + 10 * x + 9;
endfunction

function y = g4(x)
    y = (2 * x.^3 - 9) ./ (3 * (x.^2 + 3));
endfunction

t = -3:0.1:0;
disp(" f(x) es la función que empieza en la esquina inferior izquierda");
plot([-3, 0], [0, 0], t, f(t), 'k');
hold on;
plot(t, t - g1(t), 'r', t, t - g2(t), 'b', t, t - g3(t), 'g', t, t - g4(t), 'y');
axis([-3 0 -3 3]);
hold off;
# Apartado b

function out = aplicar_iteracion_funcional (g, x0 = -1.5, numero_iteraciones = 10)

    for i = 1:numero_iteraciones

    endfor

endfunction

disp("Recordamos que la convergencia de la iteracion funcional requiere que la derivada del mÃ©todo sea ")
x0 = -1.5;
iteraciones = 10;
disp("MÃ©todo con g1")

for i = 1:iteraciones
    x1 = g1(x0);
    x0 = x1
endfor

plot(t, t - g1(t), [-3, 0], [0, 0])
disp("Método con g2")
x0 = -1.5;

for i = 1:iteraciones
    x1 = g2(x0);
    x0 = x1
endfor

plot(t, t - g2(t), [-3, 0], [0, 0]);

disp("Metodo con g3")
x0 = -1.5;

for i = 1:iteraciones
    x1 = g3(x0);
    x0 = x1
endfor

plot(t, t - g3(t), [-3, 0], [0, 0])
disp("MÃ©todo con g4")
x0 = -1.5;

for i = 1:iteraciones
    x1 = g4(x0);
    x0 = x1
endfor

plot(t, t - g4(t), [-3, 0], [0, 0])
