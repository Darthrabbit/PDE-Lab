function [col] = get_column(index, idx2row, row2length)

col = abs(sum(row2length(1:idx2row(index)-1)) - index);