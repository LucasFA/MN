clc; clear all; more off;

function y = g1(x)
    y = -(x.^3) ./ 9 - 1;
endfunction

function y = g3(x)
    y = x.^3 + 10 * x + 9;
endfunction

function out = aplicar_iteracion_funcional (g, x_0, numero_iteraciones = 10)
    x(1) = x_0;

    for i = 2:numero_iteraciones
        x(i) = g(x(i - 1));
    endfor

    out = x;
endfunction

function out = aplicar_aitken(g, x_0, numero_terminos)
    x = aplicar_iteracion_funcional(g, x_0, numero_terminos + 2);

    for n = 1:numero_terminos
        x_acel(n) = (x(n + 2) * x(n) - x(n + 1)^2) / (x(n + 2) + x(n) - 2 * x(n + 1));
    endfor

    out = x_acel;
endfunction

function out = aplicar_steffensen(g, x_0, control_iteraciones = 1000)
    # recordamos que nuestra implementaci�n de Aitken llama a iteracion funcional
    # con lo cual nos ahorramos llamar a aplicar_iteracion_funcional y sobre ese resultado aplicar Aitken,
    # y se hace directamente.
    if (control_iteraciones < 0)
        return;
    endif

    if (0 < control_iteraciones && control_iteraciones < 1)
        numero_terminos = 1000;
        tol = control_iteraciones;
    else
        numero_terminos = control_iteraciones;
        tol = 0;
    endif

    x_acel(1) = aplicar_aitken(g, x_0, 1);

    for n = 2:numero_terminos
        x_acel(n) = aplicar_aitken(g, x_acel(n - 1), 1);

        if (abs(x_acel(n) - x_acel(n - 1)) < tol)
            break;
        endif

    endfor

    out = x_acel;
endfunction


# Apartado a
x0 = -1.5;
iteraciones_a_hacer = 12;

resultado_iter_funcional = aplicar_iteracion_funcional(@g1, x_0 = x0, numero_iteraciones = iteraciones_a_hacer);
resultado_aitken = aplicar_aitken(@g1, x_0 = x0, numero_terminos = iteraciones_a_hacer);
resultado_steffensen = aplicar_steffensen(@g1, x_0 = x0, numero_terminos = iteraciones_a_hacer / 3);

printf("Tabla de resultados:\n");
printf("    It. funcional         Aitken           Steffensen\n");

for n = 1:iteraciones_a_hacer
    printf("  %.12f    %.12f", resultado_iter_funcional(n), resultado_aitken(n));

    if (mod(n, 3) == 0)
        printf("    %.12f", resultado_steffensen(n / 3));
    endif

    printf("\n");
endfor

printf("\n")
printf("Naturalmente, la sucesion de Aitken y Steffensen convergen mas rapidamente. \
Steffensen tiene en cada fila los mismos valores que Aitken pues es lo mismo");
printf("\n")

# Apartado b
aprox_stef = aplicar_steffensen(@g3, x_0 = -1.5, 10^(-8));
printf("Aplicamos el metodo de Steffensen a g3. En cada linea tenemos una iteracion\n\n");

for val = aprox_stef
    printf(" %.12f\n", val);
endfor

printf("\n");
printf("g3 debe tener una raiz alrededor de -0.91490784\n");
