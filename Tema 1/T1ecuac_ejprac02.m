clc;
clear all;
more off;

function y = f(x)
    y = x.^3 + 9 * x + 9;
endfunction

function y = g1(x)
    y = -(x.^3) ./ 9 - 1;
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

t = linspace(-3, 0, 30);
disp(" f(x) es la funcion que abajo, con pendiente significativa");
plot([-3, 0], [0, 0], t, f(t), 'k');
hold on;
plot(t, t - g1(t), 'r', t, t - g2(t), 'b', t, t - g3(t), 'g', t, t - g4(t), 'y');
axis([-3 0 -3 3]);
hold off;
input("Pulse para continuar")

% ????????????????????????????????????????????????????????????????????????????????
# Apartado b

function out = aplicar_iteracion_funcional (g, x0 = -1.5, numero_iteraciones = 10)
    printf("n,   aprox\n")

    for i = 1:numero_iteraciones
        x1 = g(x0);
        x0 = x1;
        printf("%i   %6.8f\n", i, x1)
    endfor

    out = x1;
endfunction

printf(["Recordamos que la convergencia de " ...
        "la iteracion funcional requiere \nque la derivada del metodo sea menor que 1 " ...
        "en el punto fijo, es decir: tenga pendiente menor que 1 en valor absoluto\n"])

%x0 = -1.5;
%iteraciones = 10;

printf("Metodo con g1\n");
aprox = aplicar_iteracion_funcional(@g1);
plot(t, t - g1(t), [-3, 0], [0, 0]);
axis([-1.5, -0.5, -0.5, 0.5], "square");
input("Presione enter para continuar");

disp("M�todo con g2\n");
aplicar_iteracion_funcional(@g2);
plot(t, t - g2(t), [-3, 0], [0, 0]);
axis([-1.5, -0.5, -0.5, 0.5], "square");
input("Presione enter para continuar");

disp("Metodo con g3\n");
aplicar_iteracion_funcional(@g3);
plot(t, t - g3(t), [-3, 0], [0, 0]);
axis([-1.5, -0.5, -0.5, 0.5], "square");
input("Presione enter para continuar");
% g3 evidentemente tiene una pendiente demasiado grande para permitir la convergencia

disp("Metodo con g4\n");
aplicar_iteracion_funcional(@g4);
plot(t, t - g4(t), [-3, 0], [0, 0]);
axis([-1.5, -0.5, -0.5, 0.5], "square");
input("Presione enter para continuar");

% ????????????????????????????????????????????????????????????????????????????????
% c
function out = iteraciones_para_iteracion_funcional (g, x0 = -1.5)
    n = 0;

    do
        x1 = g(x0);
        x0 = x1;
        n++;
    until (max(abs(x1 - x0), abs(f(x0))) < 10^(-7))

    out = n;
endfunction

printf("Numero de iteraciones para cada metodo convergente:\n");
printf("Metodo 1: %i\n", iteraciones_para_iteracion_funcional(@g1));
printf("Metodo 2: %i\n", iteraciones_para_iteracion_funcional(@g2));
printf("Metodo 4: %i\n", iteraciones_para_iteracion_funcional(@g4));
