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
# Intervalo:[7, 10] (la mayor de las soluciones)

# c) Aplicar biseccion
tol = 0.05;
a = 7;
b = 10;
m = (a + b) / 2;
i = 0;
err = b - a;
printf("Aplicamos biseccion. Tabla:\n")
printf("Iteracion,  a            b            m       cota de error\n")

do
    i++;

    if (f(a) * f(m) < 0)
        b = m;
    else
        a = m;
    endif

    m = (a + b) / 2;
    err /= 2;
    printf("%2i, %12.4f %12.4f %12.4f %12.4f\n", i, a, b, m, err);

until err < tol

# Hacer NR en ese intervalo [a, b]
#Derivada de f, calculada a parte
printf("\nAhora en ese intervalo aplicamos Newton-Raphson\n")

function y = g(x)
    y = -((x - 3) * e^(-x / 3)) / 3;
endfunction

i = 0;
x_n = x_next = (a + b) / 2;

do i++;
    x_n = x_next;
    x_next = x_n - f(x_n) / g(x_n);
    err = abs(x_next - x_n);
until err / abs(x_n) < 10^(-6) || i > 200

printf("Las dos ultimas aproximaciones de la raiz son %7.10f y %7.10f\n", x_n, x_next);
