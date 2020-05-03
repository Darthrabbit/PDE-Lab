function [f] = f1(x,y)

r = sqrt(x.^2 + y.^2);
f = zeros(size(x));
I = find(r < 0.25);

f(I) = -1*10^8*exp(1./(r(I).^2 - .25^2));

end