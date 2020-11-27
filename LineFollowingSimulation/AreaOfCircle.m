syms x r
expr = sqrt(r^2 - x^2);
F(r) = int(expr,[-r r] * 2);

i = linspace(-1, 1);
ans1 = F(i);

subplot(2, 1, 1)
plot(i, ans1);

T = taylor(F);
ans2 = T(i);

subplot(2, 1, 2)
plot(i, ans2);
