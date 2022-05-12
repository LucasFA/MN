clc;

function y = f(x)
    y = 1 ./ (1 + x.^2);
endfunction

a = -5;
b = 5;

exacto = quad(@f, a, b)
disp("========================");
disp("n   aprox    error");
disp("========================");

% valores de n a probar
valores = [1:6 10 15 20];
for n = valores
    disp("============")
    printf("Ahora con n = %d\n", n)
    [nodos pesos] = integralNC(a, b, n, true, true);
    aprox = pesos * (f(nodos)');
    printf("%2d  %12.4f  %12.4f\n", n, aprox, aprox - exacto)
endfor
