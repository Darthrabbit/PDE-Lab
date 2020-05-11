% Sarah Jurke 1521352
% Lucas Kersken 1457073
% Moritz Proell 1652588

function [alpha] = get_alphas(h_E, h_S, h_W, h_N)
% Returns the scaling values for the five point stencil
% (Numerical Analysis and Simulation of Partial Differential Equations, 
%  Roland Pulch & Jan ter Maten, page 33.)

alpha = [   
            2/(h_E*h_W) + 2/(h_N*h_S)
            -2/(h_E*(h_E + h_W))
            -2/(h_S*(h_N + h_S))
            -2/(h_W*(h_E + h_W))
            -2/(h_N*(h_N + h_S))
        ];

end