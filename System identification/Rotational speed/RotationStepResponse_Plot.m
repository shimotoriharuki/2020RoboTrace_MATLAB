% ステップ応答をプロット

%0.5[s]

%ステップ入力振幅：500, サンプリング周期：1ms
dataL = importdata("Encorder log/left.txt");
dataR = importdata("Encorder log/right.txt");
system = importdata("Identificated_system.mat");

Omega = importdata("Identification Log/Omega.txt");

% plot(dataL);

%{
t = linspace(0, 3000, 3000);
V = linspace(500, 500, 3000);
subplot(2, 1, 1);
plot(t, V);
xlabel('t[ms]');
ylabel('PulseWidth');
title('Step Input');
%}

subplot(2, 1, 1);
plot(Omega);
xlim([0 3000]);
ylim([-30 0]);
% legend("Omega");
xlabel('t[ms]');
ylabel('AngularVelocity[rad/s]');
title('Output');

opt = stepDataOptions('StepAmplitude',500);

subplot(2, 1, 2);
stepplot(system, 3, opt);

% legend("Transfer function");
% pidTuner(); 

