% Sarah Jurke 1521352
% Lucas Kersken 1457073
% Moritz Proell 1652588

function [A, b] = linear_system(border, domain, neighbours, stepsizes, h, fname, gname)
% Creates the linear system that has to be solved for a general domain.
% (Numerical Analysis and Simulation of Partial Differential Equations, 
%  Roland Pulch & Jan ter Maten, page 34, algorithm 2.1 line 4-6)

n = length(domain);

A = sparse(n);
b = h^2 * feval(fname, domain(:,1), domain(:, 2));

for row = 1 : n
    alpha = get_alphas( stepsizes(row,1), stepsizes(row,2), ...
                        stepsizes(row,3), stepsizes(row,4));
    
    A(row, row) = alpha(1);
    
    for i = 1 : 4
        idx = neighbours(row, i);
        if  idx > 0 % in domain
            A(row, idx) = alpha(i+1);
        else % on border, shift to rhs
            idx = -idx;
            b(row) = b(row) - alpha(i+1) * gname(border(idx, 1), border(idx, 2));
        end
    end
end
    
end
