% Sarah Jurke 1521352
% Lucas Kersken 1457073
% Moritz Proell 1652588

function [neighbours] = set_neighbours(domain, idx2row, row2length, neighbours)
% Set the neighbours according to the five star stencil
% (Inspired by sparse matrix indexing)

number_of_rows  = length(row2length);

for idx_center = 1 : length(domain)    
    c_row_length    = row2length(idx2row(idx_center));
    n_row_length    = row2length(min(idx2row(idx_center) + 1, number_of_rows));
    s_row_length    = row2length(max(idx2row(idx_center) - 1, 1));

    % East
    if neighbours(idx_center, 1) == 0
        neighbours(idx_center, 1) = idx_center + 1;
    end

    % South
    if neighbours(idx_center, 2) == 0
        offset = -floor((c_row_length - s_row_length)/2) - s_row_length;
        index = idx_center + offset;
        neighbours(idx_center, 2) = index;
    end

    % West
    if neighbours(idx_center, 3) == 0
        neighbours(idx_center, 3) = idx_center - 1;
    end

    % North
    if neighbours(idx_center, 4) == 0
        offset = floor((n_row_length - c_row_length)/2) + c_row_length;
        index = idx_center + offset;
        neighbours(idx_center, 4) = index;
    end
end
   