% Sarah Jurke 1521352
% Lucas Kersken 1457073
% Moritz Proell 1652588

function [u,A] = poisson(fname, gname, m)
% Solves the poisson equation on the unit disk

h = 2 / (m + 1);
[border, domain, idx2row, row2length, neighbours, stepsizes] = discretize_unit_disk(m);
[A,b] = linear_system(border, domain, neighbours, stepsizes, h, fname, gname);

w = A\b;

u = map_onto_regular_grid(w, m, row2length);

end