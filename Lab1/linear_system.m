function [A, b] = linear_system(border, domain, neighbours, stepsizes, rhs, border_func)

n = length(domain);

A = sparse(n);
b = feval(rhs, domain(:,1), domain(:, 2));

for row = 1 : n
    alpha = get_alphas( stepsizes(row,1), stepsizes(row,2), ...
                        stepsizes(row,3), stepsizes(row,4));
    
    A(row, row) = alpha(1);
    
    for i = 1 : 4
        idx = neighbours(row, i);
        if  idx > 0
            A(row, idx) = alpha(i+1);
        else
            idx = -idx;
            b(row) = b(row) - alpha(i+1) * border_func(border(idx, 1), border(idx, 2));
        end
    end
end
    
end
