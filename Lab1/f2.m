function [f] = f2(x, y)
 f = 100.0 * sin(x.*(2.0 * pi)).*sin(y.*(2.0 * pi));
end