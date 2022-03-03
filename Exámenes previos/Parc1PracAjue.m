clc;
clear all;

function val = g(x)
  val = x - 0.016*f(x)
endfunction

function val = f(x)
  val = power(x,3)+9*power(x,2)-6*exp(cos(pi*x))
endfunction

x = 0.5:0.05:1;

hold on
plot(x,g(x))

plot(x,x)
hold on

plot(x,f(x))

plot(x,0)



x0 = 0.5
for i =1:15
  x1= g(x0)
  x0=x1
endfor
disp(x1)