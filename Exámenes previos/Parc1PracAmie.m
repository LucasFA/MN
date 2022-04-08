clc

function val = f(x)
    val = x^3 * exp(-x / 3) - 0.8 * sin(x)
endfunction

%figure(1)
%for x = -10:0.1:10
%  plot((x,f(x)), (x+0.05, f(x+0.05)))
%endfor

function aprox = fNR(@f, a, b)
    x0 = (a + b) / 2;
    tol = 10^(-10)
    error = 1
    fd = f'
    printf("x     f(x)     error ")

    do
        x1 = x0 - f(x0) / fd(x0)
        error = abs(x1 - x0) / abs(x0)
        printf("%.6f,%.6f %.6f", x1, f(x1), error)
    until (error < tol)

endfunction
