pre_velo = importdata("Translation Log/pre_velo.txt");
% pre_velo400 = importdata("Translation Log/pre_velo400.txt");

subplot(2, 1, 1);
plot(pre_velo);
% plot(pre_velo400);

system = importdata("plant.mat");
opt = stepDataOptions('StepAmplitude',300);

subplot(2, 1, 2);
stepplot(system, 3, opt);