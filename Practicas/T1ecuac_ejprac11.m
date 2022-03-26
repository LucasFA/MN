clc; clear all; more off;
function y = f(x)
    y(1) = sin(x(1) * x(2)) / 2 - x(2) / (4 * pi) - x(1) / 2;
    y(2) = (1 - 1 / (4 * pi)) * (exp(2 * x(1)) - e) + (e / pi) * x(2) - 2 * e * x(1);
endfunction

s1 = [-2, -2];
s2 = [-1, -1];
s3 = [0, 0];
s4 = [1, 1];
s5 = [2, 2];

tol = 10^(-8);

function y = paso_NR(semilla)

endfunction

function NR()

endfunction