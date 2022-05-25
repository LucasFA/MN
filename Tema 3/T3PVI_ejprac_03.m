clc; clear all;
function x1 = f(t,x) 
    x1 = [
        x(1) - t*x(2) + sin(3*t)
        2*x(1) + x(2) - t
    ]
endfunction


x0 = [5,-1]; a = 0; b = 3;
h = 0.25; N = (b-a)/N;

t = linspace(a,b,N+1);

x(1:) = x0;

for n=1:N 
    x(n+1,:)  = x(n,:) + h*F(t(n), x(n,:));
endfor

figure(1);
plot(x(:,1), x(:,2), "b;Euler;", "linewidth", 6);
# abcisas primera columna, ordenas segunda columna

# ----------------
# RK4

x(1,:) = x0;

for n = 1:n

endfunction

