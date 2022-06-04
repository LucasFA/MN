###########################################
### Ejercicios practicos de PVI ###########
###########################################
%
% funcion para evaluar un metodo RK dado
% su arreglo de Butcher, que puede ser
% explícito o semi-implicito
%
% este archivo es la definicion de una
% funcion. Por tanto la primera instruccion
% ejecutable es la palabra function


% Da un paso en el método de RK dado con su arreglo de Butcher
% a, b y c representan el arreglo de Butcher.
% a es una matriz m*m
% b y c son vectores de longitud m. 
% c representan los pasos (columna izquierda) de h respecto de t
% b representan los pesos (fila inferior) de cada Ki en el resultado x1 final
%
%           x1 = x0 + h sum_{j=1}^m b_j * K_j(t0,x0)
% donde
%           K_i(t,x) = f(t + c_i*h, x+h sum_{j=1}^m a_{ij} * K_j(t,x)) 
% donde aquí tenemos t=t0, x = x0

function [t1 x1] = ButcherSemi(a, b, c, t0, x0, h)
    m = length(c);
    K(1) = f(t0 + c(1) * h, x0);
    if a(1, 1)
        K(1) = fsolve(@(u) 
            f(
                t0 + c(1) * h, 
                x0 + h * a(1, 1) * u
            ) 
            - u, 
            K(1)
            );
    endif

    for i = 2:m
        K(i) = 
            f(
                t0 + c(i) * h, 
                x0 + h * a(i, 1:i - 1) * K(1:i - 1)'
            );

        if a(i, i)
            K(i) = fsolve(@(u)
                f(
                    t0 + c(i) * h,
                    x0 + h * a(i, 1:i - 1) * K(1:i - 1)' + h * a(i, i) * u
                )
                - u,
                K(i)
                );
        endif
    endfor

    t1 = t0 + h;
    x1 = x0 + h * b * K';
endfunction
