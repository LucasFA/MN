clc; clear all;
function x1 = f(t,x) 
    x1 = [
        x(1) - t*x(2) + sin(3*t)
        2*x(1) + x(2) - t
    ]
endfunction


x0 = [5,-1]; a = 0; b = 3;
h = 0.025; N = (b-a)/h;

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

for n = 1:N
    K1 = F(t(n), x(n,:));
    K2 = F(t(n) + h/2, x(n,:) + h/2*K1 );
    K3 = F(t(n) + h/2, x(n,:) + h/2*K2 );
    K4 = F(t(n) + h, x(n,:) + h*K3);
    x(n+1, :) = x(n,:) + h/6 * (K1 + 2*K2+2*K3+K4);
endfunction

hold on;
plot(x(:, 1), x(:,2), "r;RK4", "linewidth", 6)
hold off;

disp("Son muy diferentes. Euler tendrá un error muy grande");
disp("=============FIN=============");
