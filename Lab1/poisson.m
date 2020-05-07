function [u,A] = poisson(fname, gname, m)

h = 2 / (m + 1);
[border, domain, idx2row, row2length, neighbours, stepsizes] = discretize_unit_disk(m);
[A,b] = linear_system(border, domain, neighbours, stepsizes, h, fname, gname);

w = A\b;

u = map_onto_unit_disc(w, m, row2length);

end