clc; clear all;

function y = f(x)
  y = [4*x(1)^2+x(2)^2-4; x(1) + x(2) - sin(x(1)-x(2))];
endfunction

function M = J(x)
  M = [8*x(1), 2*x(2); 1- cos(x(1)-x(2), 1 - cos(x(1)-x(2)];
endfunction

tol = 10^(-8)
x1 = x0 = 0;
n = 0;
do
  x0 = x1;
  x1 = x0 - J(x0)\f(x0);
  n++;
until norm(x1-x0, 1) < tol

printf("Se obtiene en ")
