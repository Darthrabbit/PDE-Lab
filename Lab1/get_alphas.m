function [alpha] = get_alphas(h_E, h_S, h_W, h_N)

alpha = [   
            2/(h_E*h_W) + 2/(h_N*h_S)
            -2/(h_E*(h_E + h_W))
            -2/(h_S*(h_N + h_S))
            -2/(h_W*(h_E + h_W))
            -2/(h_N*(h_N + h_S))
        ];

end