clear;
% ステップ応答をプロット

%ステップ入力振幅：500, サンプリング周期：1ms
dataL = importdata("Encorder log/left.txt");
dataR = importdata("Encorder log/right.txt");

plot(dataL);
hold on
plot(dataR);
hold off

legend("left", "right");

% pidTuner(); 

