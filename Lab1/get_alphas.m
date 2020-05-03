function [alpha] = get_alphas(stepsizes)

a_C = @(h_E, h_S, h_W, h_N) 2/(h_W*h_E) + 2/(h_N*h_S);
a_E = @(h_E, h_W) -2/(h_E*(h_E + h_W));
a_S = @(h_S, h_N) -2/(h_S*(h_N + h_S));
a_W = @(h_E, h_W) -2/(h_W*(h_E + h_W));
a_N = @(h_S, h_N) -2/(h_N*(h_S + h_N));

alpha = [   
            a_C(stepsizes(1), stepsizes(2), stepsizes(3), stepsizes(4)), ...
            a_E(stepsizes(1), stepsizes(3)), ...
            a_S(stepsizes(2), stepsizes(4)), ...
            a_W(stepsizes(1), stepsizes(3)), ...
            a_N(stepsizes(2), stepsizes(4))
        ];

end