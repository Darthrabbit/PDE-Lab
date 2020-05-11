% Sarah Jurke 1521352
% Lucas Kersken 1457073
% Moritz Proell 1652588

function [u] = map_onto_regular_grid(w, m, row2length)
% Map the calculated vector w onto a m x m grid for plotting

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