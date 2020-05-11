% Sarah Jurke 1521352
% Lucas Kersken 1457073
% Moritz Proell 1652588

function [border, domain, idx2row, row2length, neighbours, stepsizes] = discretize_unit_disk(M)
% Returns a discretization of the unit disk, given a number of discrete points M
% (Inspired by sparse matrix indexing)
%
% broder    - contains positions of points on the border
% domain    - contains positions of points in the domain
% idx2row   - maps the index of a point to its row in the domain
% row2lenght- maps a row to its length
% neighbours- neighbours(i) contains [E S W N] indices for domain(i).
%             index > 0 inside domain
%             index < 0 on border
%             index = 0 not yet set
% stepsizes- stepsizes(i) contains [h_E, h_S, h_W, h_N] for domain(i)

h = 2 / (M + 1);
dist_from_border = @(x,y) x*x + y*y - 1;

in_domain = 0;
on_border = 0;
domain = [];
neighbours = [];
stepsizes = [];
idx2row = [];
row2length = [];
border = [];

TOL = 10^-15;

for i = 1 : M
    row_length = 0;
    for j = 1 : M
        y_h = -1 + i*h;    
        x_h = -1 + j*h;            
            
        % Inside the disc
        if  dist_from_border(x_h, y_h) < 0
            row_length = row_length + 1;
            in_domain = in_domain + 1;
            
            domain(in_domain, 1) = x_h;
            domain(in_domain, 2) = y_h;
            idx2row(in_domain) = i;

            % East Border
            dist = dist_from_border(x_h + h, y_h); 
            if dist > 0 || abs(dist) < TOL
                on_border = on_border + 1;

                h_E = min(abs(roots([1, 2*x_h, x_h^2+y_h^2-1])));
                border(on_border, 1) = x_h + h_E;
                border(on_border, 2) = y_h;
                neighbours(in_domain, 1) = -on_border;
                stepsizes(in_domain, 1)  = h_E;
            else
                neighbours(in_domain, 1) = 0;
                stepsizes(in_domain, 1)  = h;
            end

            % South Border
            dist = dist_from_border(x_h, y_h - h);
            if dist > 0 || abs(dist) < TOL                
                on_border = on_border + 1;

                h_S = min(abs(roots([1, -2*y_h, x_h^2+y_h^2-1])));
                border(on_border, 1) = x_h;
                border(on_border, 2) = y_h - h_S;
                neighbours(in_domain, 2) = -on_border;
                stepsizes(in_domain, 2)  = h_S;
            else
                neighbours(in_domain, 2) = 0;
                stepsizes(in_domain, 2)  = h;          
            end

            % West Border
            dist = dist_from_border(x_h - h, y_h);
            if dist > 0 || abs(dist) < TOL                
                on_border = on_border + 1;
                
                h_W = min(abs(roots([1, -2*x_h, x_h^2+y_h^2-1])));
                border(on_border, 1) = x_h - h_W;
                border(on_border, 2) = y_h;
                neighbours(in_domain, 3) = -on_border;
                stepsizes(in_domain, 3)  = h_W;
            else
                neighbours(in_domain, 3) = 0;
                stepsizes(in_domain, 3)  = h;
            end

            % North Border
            dist = dist_from_border(x_h, y_h + h);
            if dist > 0 || abs(dist) < TOL
                on_border = on_border + 1;
                
                h_N = min(abs(roots([1, 2*y_h, x_h^2+y_h^2-1])));
                border(on_border, 1) = x_h;
                border(on_border, 2) = y_h + h_N;
                neighbours(in_domain, 4) = -on_border;
                stepsizes(in_domain, 4)  = h_N;                
            else
                neighbours(in_domain, 4) = 0;
                stepsizes(in_domain, 4) = h;
            end           
        end
    end
    if row_length > 0
        row2length(i) = row_length;
    end
end

neighbours = set_neighbours(domain, idx2row, row2length, neighbours);



