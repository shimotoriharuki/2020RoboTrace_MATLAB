mu = 0;
sigma = 2;  %•W€•Î·

data1 = mu + randn(10000, 1) * sigma;
for i = 1 : 10000
    data2(i, 1) = normrnd(mu,sigma);
end

subplot(2, 1, 1)
normplot(data1);

subplot(2, 1, 2)
normplot(data2);

stats1 = [mean(data1) std(data1) var(data1)]; %var:•ªU
stats2 = [mean(data2) std(data2) var(data2)];

disp(stats1);
disp(stats2);