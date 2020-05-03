function [u,A] = poisson(fname, gname, m)

[border, domain, idx2row, row2length, neighbours, stepsizes] = discretize_unit_disk(m);

[A,b] = linear_system(border, domain, neighbours, stepsizes, fname, gname);

w = A\b;
u = NaN(m);
elements_put_in = 0;

for i = 1:m
    elements_put_in = elements_put_in + 1;
    offset = (m - row2length(i))/2;
    
    for j = 1 : row2length(i)
        u(i, j+offset) = w(elements_put_in);
    end
end

end