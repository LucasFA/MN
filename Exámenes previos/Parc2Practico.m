clc; clear all;

function y = f(t)
    y = 3 * cos(t / 2) + log(t + 3) + 1;
endfunction

function y = F(t)
    y = 6 * sin(t / 2) + (t + 3) * log(t + 3);
endfunction

%plot F
X = 0:0.1:10;
Y = [];

for i = 1:101
    Y(i) = F(X(i));
endfor

plot(X, Y)
clear Y; clear X;
% 2)

%nodos:
t = []
% AVISO: lo que en el examen se denota t_0 aqu� uso t(1), de ah� el cambio de indice hasta 31
t(1) = 0; t(31) = 10;

for i = 2:30
    t(i) = 10 / (1 + exp(15 - i));
endfor

%Approximate F
aproxF = [];
aproxF(1) = 3 * log(3);

for i = 2:30
    h = t(i) - t(i - 1);
    aproxF(i) = aproxF(i - 1) + h * (f(t(i - 1)) + f(t(i))) / 2;
endfor

% 3)
%plot approximation
X = t;
Y = [];

for i = 1:100
    Y(i) = aproxF(i);
endfor

plot(X, Y)
hold off;

% 4)
x = []
x(1) = 3 * log(3);

cachef = [];

for i = 1:31
    cachef(i) = f(t(i));
endfor

%nota: _cachef(i) = f(t(i))_
%observaci�n : normalmente
%RK1 = f(t_i, x_i) etc, aqu� es f(t_i)
%RK2 = f(t_i+h/2)
for i = 1:30
    h = t(i + 1) - t(i);

    RK1 = cachef(i);
    RK2 = f(t(i) + h / 2);
    RK3 = RK2; % en este caso, son iguales pues f no depende de x
    RK4 = cachef(i + 1);
    x(i + 1) = x(i) + h * (RK1 + 2 * RK2 + 2 * RK3 + RK4) / 6;
endfor

X = t;
Y = x;

plot(X, Y)
