function [nodos pesos] = integralNC(a, b, n, izda, dcha)
    % izda y dcha indican si se incluye ese extremo
    nodos = linspace(a, b, n + 1);

    if !dcha
        nodos(n + 1) = [];
        n--;
    endif

    if !izda
        nodos(1) = [];
        n--;
    endif

    M = ones(n + 1, n + 1);
    M(2, :) = nodos;
    for i = 2:n
        M(i + 1, :) = nodos.^i;
    endfor

    c = zeros(n + 1, 1);
    for i = 1:n + 1
        c(i, 1) = (b^i - a^i) / i;
    endfor

    pesos = (M \ c)';
endfunction

