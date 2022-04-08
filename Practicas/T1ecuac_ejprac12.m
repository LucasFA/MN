clc; clear all; more off;

function y = F(x)
    y = x + 0.999 * sin(x);
endfunction

function y = F_prima(x)
    y = 1 + 0.999 * cos(x);
endfunction

t = linspace(-10, 10, 100);
plot(t, F(t));
line([-10 10], [0 0]);

x = [13 13];
for iteraciones = [50 100 150 200]
    printf("\nCon %3d iteraciones:\n", iteraciones);

    for n = 2:iteraciones
        x(n) = x(n - 1) - F(x(n - 1)) / F_prima(x(n - 1));
        error = abs(x(n) - x(n - 1));
        % if (mod(n, 3) == 0)
        formato = "%14.2f";
        printf(["%3d " formato formato formato "\n"], n, x(n), F(x(n)), error)
        % endif
    endfor
endfor

printf(["\n" "Se observa que el metodo converge (para cualquier semillas, de hecho), " \
    "pero los puntos que casi anulan la derivada de F \n" \
    "son patologicos y causan grandes cambios en el valor de la aproximacion\n"]);

t = linspace(0, 1, 101);
function x1 = pasoNR(x0)
    x1 = x0 - F(x0) / F_prima(x0); 
endfunction