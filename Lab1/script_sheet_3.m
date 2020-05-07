clear;
close all;

m = 50;

[u, A] = poisson(@f2, @g3, m);
surf(u)