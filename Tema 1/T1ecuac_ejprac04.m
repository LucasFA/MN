clear all; more off;
clc;

function y = f(x)
    y = (exp(-x.^2) + 0.75 * x).^3;
endfunction

# Apartado a

function [x, iter] = secante(f, x0, x1, max_iter = 100, tol = 0)
    if (x0 == x1)
        printf("Error. x1 == x0 en secante\n")
        return;
    endif
    iter = 0;

    f0 = f(x0);
    f1 = f(x1);

    x = [x0, x0, x1];
    do
        x(1) = x(2);
        x(2) = x(3);

        f0 = f(x(1));
        f1 = f(x(2));

        x(3) = x(2) - (x(2) - x(1)) * (f1) / (f1 - f0);

        ++iter;
        er = abs(x(3) - x(2));
    until (er < tol || iter >= max_iter)
endfunction

x0 = -0.75;
x1 = -0.76;
tol = 10^(-6);

[aprox, iteraciones] = secante(@f, x0, x1, 1000, tol);
printf("Aproximacion: %f\nIteraciones: %i\n", aprox(3), iteraciones);

# Apartado b
# secante + Aitken
printf("\n")
printf("Apartado b\n")
function d = diferencia_progresiva(x, n)
    d = x(n + 1) - x(n);
endfunction

function x_acel = Aitken(x)
    for n = 1:(length(x) - 2)
        x_acel(n) = x(n) - diferencia_progresiva(x, n)^2 / (diferencia_progresiva(x, n + 1) - diferencia_progresiva(x, n));
        #x_acel(n) = (x(n + 2) * x(n) - x(n + 1)^2) / (x(n + 2) - 2 * x(n + 1) + x(n));
    endfor
endfunction

x0 = -0.75;
x1 = -0.76;
tol = 10^(-6);
er = tol + 1;
iter = 0;

x2 = x1;
x1 = x0;
printf("n        aprox           metodo\n")
while er > tol && iter < 100
    out = secante(@f, x1, x2, 3, 0);
    x0 = out(1);
    x1 = out(2);
    x2 = out(3);
    printf("%2i %.16f  Secante\n%2i %.16f  Secante\n%2i %.16f  Secante\n", ++iter, x0, ++iter, x1, ++iter, x2);
    temp = Aitken([x0, x1, x2]); 
	#cambiando la linea anterior por lo siguiente:
	#secante(@f, x1, x2, 1, 0)(3) nos dar�a el metodo de la secante usual
    printf("%2i %.16f  Aitken\n", ++iter, temp);

    x0 = x1;
    x1 = x2;
    x2 = temp;
    er = abs(x2 - x1);
endwhile

printf("El metodo de Aitken aqui nos defrauda.\nSalvo fallo de implementacion, el metodo de la secante con Aitken \
requiere \nunas 40 iteraciones mientras que el metodo de la secante usual solo necesita 25\n");
# Lo cual probablemente signifique  que est� mal implementado