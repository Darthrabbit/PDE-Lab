clear;
close all;

m = 50;

[u1, A] = poisson(@f1, @g1, m);
[u2, ~] = poisson(@f1, @g2, m);
[u3, ~] = poisson(@f2, @g1, m);
[u4, ~] = poisson(@f2, @g2, m);

subplot(2, 4, 1)
surf(u1)
title("f1, g1")

subplot(2, 4, 2)
surf(u2)
title("f1, g2")

subplot(2, 4, 5)
surf(u3)
title("f2, g1")

subplot(2, 4, 6)
surf(u4)
title("f2, g2")

subplot(2, 4, [3, 4, 7, 8])
hold on;
grid on;
spy(A)