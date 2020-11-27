%main.m

SampleNum = 1000;
theta = linspace(0, 1.1 * pi, SampleNum);
funcX = @(th) sin(3 * th);
funcY = @(th) sin(2 * th);
Position = zeros(SampleNum, 2);
for i = 1 : SampleNum
    Position(i, 1) = funcX(theta(i));
    Position(i, 2) = funcY(theta(i));
end

figure(1)
scatter(Position(:, 1), Position(:, 2)) % 位置データ

SearchRange = 0.1;
Flag = GetFlag(Position, SearchRange, SampleNum);

figure(2)
plot(theta, Flag) % 交差している箇所の確認

