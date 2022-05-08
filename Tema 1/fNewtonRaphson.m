function [x1, n, msg] = fNewtonRaphson(f, f1, x0, tol = 0.000001, nmax = 100)
    n = 0; %numero de iteraciones
    msg = "Error";

    if tol <= 0
        msg = "error < 0"
        return;
    endif

    if nmax < 2 || nmax > 1000
        msg = "nmax exagerado";
        return;
    endif

    error = tol + 1;

    while error > tol && n <= nmax
        x1 = x0 - f(x0) / f1(x0);
        n++;
        error = abs((x1 - x0) / x1);
        x0 = x1;
    endwhile

    
    % Mensaje de salida
    if n >= nmax
        msg = "Límite de iteraciones excedido. No converge";
        return;
    endif

    msg = "Ejecucion valida. Converge";
endfunction
