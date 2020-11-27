%{
% m系列信号の応答

%0.5[s]

%ステップ入力振幅：500, サンプリング周期：1ms
dataL = importdata("Encorder log/left_M.txt");
dataR = importdata("Encorder log/right_M.txt");
Omega = importdata("Encorder log/Omega.txt");
%{
plot(dataL);
hold on
plot(dataR);
hold off
%}

hold on
plot(Omega);
hold off
xlim([0 4000]);

legend("left", "right", "Omega");
%}
%%
input = importdata("Identification Log/input.txt");
output = importdata("Identification Log/output.txt");

input = input';
output = output';

num = numel(input);
t = linspace(0, num, num);

Tin = 0;

for i = 1 : num
    Temp = repmat(input(1, i), 1, 10);
    Tin = [Tin Temp];
end

Tin(: ,1) = [];

Tout = 0;
for i = 1 : num
    Temp = repmat(output(1, i), 1, 10);
    Tout = [Tout Temp];
end

Tout(: ,1) = [];

Tt = 0;
for i = 1 : num
    Temp = repmat(t(1, i), 1, 10);
    Tt = [Tt Temp];
end

Tt(: ,1) = [];


subplot(2, 1, 1);
plot(t, input);
% xlabel('t[ms]');
ylabel('PulseWidth');
xlim([0 4000]);
ylim([-510 510]);
title('Input')

subplot(2, 1, 2);
plot(t, output);
% xlabel('t[ms]');
ylabel('AngularVerocity');
xlim([0 4000]);
title('Output')


