clear;
close all;

m = 100;

[u1, A] = poisson(@f1, @g1, m);
[u2, ~] = poisson(@f1, @g2, m);
[u3, ~] = poisson(@f2, @g1, m);
[u4, ~] = poisson(@f2, @g2, m);

subplot(2, 4, 1)
s = surf(u1)
s.EdgeColor = 'none';
title("f1, g1")

subplot(2, 4, 2)
s = surf(u2)
s.EdgeColor = 'none';
title("f1, g2")

subplot(2, 4, 5)
s = surf(u3)
s.EdgeColor = 'none';
title("f2, g1")

subplot(2, 4, 6)
s = surf(u4)
s.EdgeColor = 'none';
title("f2, g2")

subplot(2, 4, [3, 4, 7, 8])
hold on;
grid on;
spy(A)