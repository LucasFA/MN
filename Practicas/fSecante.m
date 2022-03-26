function [x1, n, msg] = fSecante(f, x0, x1, tol, nmax)
    x1 = 0;
    n = 0; %numero de iteraciones
    msg = "Error";

    if tol <= 0
        msg = "error < 0"
        return
    endif

    if nmax < 2 || nmax > 1000
        msg = "nmax exagerado";
        return;
    endif

    error = tol + 1;

    do
        f0 = f(x0);
        f1 = f(x1);

        x2 = x1 - ((x1 - x0) / (f1 - f0)) * f1;

        x0 = x1;
        x1 = x2;
        error = x2 - x1;
        n++;
    until (error > tol && n <= nmax)

    % Mensaje de salida
    if n >= nmax
        msg = "Limite de iteraciones excedido. No converge";
        return;
    endif

    msg = "Ejecucion valida. Converge";
endfunction
