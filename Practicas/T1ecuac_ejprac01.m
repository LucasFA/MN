# Aplicar N - R y biseccion

clc; clear; more off;

function y = f(x)
    y = x .* exp(-x / 3) - 0.5;
endfunction

t = -1:0.1:10;
y = f(t);
plot(t, f(t));
hold on;
plot(t, 0);
hold off;
# Dos soluciones reales
# Intervalo 1:[-1, 1]
# Intervalo 2:[7, 10] (la mayor de las soluciones)

### plot(t, sin(t), t, sin(t + 0.2), t, sin(t + 0.8), [10, 20])

# c) Aplicar biseccion
e = 0.05;
a = 7;
b = 10;
i = 0;
err = b - a;
printf("Aplicamos biseccion. Tabla:\n")
printf("Iteracion,  a            b            m       cota de error\n")

do
    i++;
    m = (a + b) / 2;
    printf("%2i, %12.4f %12.4f %12.4f %12.4f\n", i, a, b, m, err);

    if (f(a) * f(m) < 0)
        b = m;
    else
        a = m;
    endif

    err = b - a;
until err < e

printf("%2i, %12.4f %12.4f %12.4f %12.4f\n", i, a, b, m, err);

# Hacer NR en ese intervalo [a, b]
#Derivada de f, calculada a parte
printf("\nAhora en ese intervalo aplicamos Newton-Raphson\n")

function y = g(x)
    y = -((x - 3) * e^(-x / 3)) / 3;
endfunction

i = 0;
x_n = (a + b) / 2;

do i++;
    x_next = x_n - f(x_n) / g(x_n);
    err = abs(x_next - x_n) #Aprovechamos para que imprima estos valores a la consola
    x_n = x_next;
until err / abs(x_n) < 10^(-6) || i > 50

printf("Aproximacion de la raiz: %7.6f\n", x_next)
