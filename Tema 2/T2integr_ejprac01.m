clc;
% clear all; more off;
% Newton Cotes
function y = f(x)
    y = exp(-x.^2/3);
endfunction

% function mostrarPesosYNodos(pesos, nodos)
%     printf("Nodos"); disp(nodos);
%     printf("Pesos"); disp(pesos);
% endfunction

disp("EJERCICIO 1 DE INTEGRACION")
a = 0;
b = 4;
exacto = quad(@f, a, b);

% Abierta 4 nodos
[nodos pesos] = integralNC(a, b, 5, false, false);

aprox = pesos * f(nodos)';

printf("Nodos"); disp(nodos);
printf("Pesos"); disp(pesos);

printf("Aprox: %14.10f error: %10.2f\n", aprox, aprox - exacto);

% Cerrada con 4 nodos
[nodos pesos] = integralNC(a, b, 3, true, true);
aprox = pesos * f(nodos)';

printf("Nodos"); disp(nodos);
printf("Pesos"); disp(pesos);

printf("Aprox: %14.10f error: %10.2f\n", aprox, aprox - exacto);


% Abierta con 3 nodos
[nodos pesos] = integralNC(a, b, 4, false, false);
aprox = pesos * f(nodos)';

printf("Nodos"); disp(nodos);
printf("Pesos"); disp(pesos);

printf("Aprox: %14.10f error: %10.2f\n", aprox, aprox - exacto);

% Semi dcha con 3 nodos

[nodos pesos] = integralNC(a, b, 3, false, true);
aprox = pesos * f(nodos)';

printf("Nodos"); disp(nodos);
printf("Pesos"); disp(pesos);

printf("Aprox: %14.10f error: %10.2f\n", aprox, aprox - exacto);

% Semi izqda con 3 nodos
[nodos pesos] = integralNC(a, b, 3, true, false);
aprox = pesos * f(nodos)';

printf("Nodos"); disp(nodos);
printf("Pesos"); disp(pesos);

printf("Aprox: %14.10f error: %10.2f\n", aprox, aprox - exacto);

disp("La mas precisa ha resultado ser la cerrada")
disp("==========================================")


