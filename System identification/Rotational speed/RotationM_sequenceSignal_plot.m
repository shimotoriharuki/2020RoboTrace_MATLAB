clear;
% �X�e�b�v�������v���b�g

%�X�e�b�v���͐U���F500, �T���v�����O�����F1ms
dataL = importdata("Encorder log/left.txt");
dataR = importdata("Encorder log/right.txt");

plot(dataL);
hold on
plot(dataR);
hold off

legend("left", "right");

% pidTuner(); 

