function [u] = map_onto_unit_disc(w, m, row2length)

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