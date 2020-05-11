% Sarah Jurke 1521352
% Lucas Kersken 1457073
% Moritz Proell 1652588

clear;
close all;

m = 50;

[u, A] = poisson(@f2, @g3, m);
surf(u)