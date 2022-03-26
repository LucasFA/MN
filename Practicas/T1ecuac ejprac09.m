# WIP
clc; clear all; more off;

function y = f(x)
    y = 1 - x + 0.3 * cos(x);
endfunction

function x1 = NR2(x0)
	

	if abs(h1) < abs(h2)
		h = h1;
	else
		h = h2;
	endif

    x1 = x0 + h;
endfunction

# Apartado b
x0 = 1.5;
x(1) = NR2(x0);
for n = 2:6
    x(n) = NR2(x(n - 1));
endfor
