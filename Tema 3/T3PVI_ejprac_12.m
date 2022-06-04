clc; clear all;

function x_prima = f(t, x)
    x_prima = -6 * x + 6;
endfunction

h = 0.1;
a = 0; b = 1;
mu = 2;

function x = s(t)
    x = 1 + exp(-6 * t);
endfunction

x = zeros(1, 4);
