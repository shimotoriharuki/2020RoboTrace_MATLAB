srnum = 7; % シフトレジスタの数。これにより出力信号の周期が設定される 上限９
helz = 2^srnum - 1; % 周期
% helz = 0.1; % 周期
len = 200; % 長さ　データが長くなる
Adjust = 0.1; % 合計時間を合わせる
x = 0 : (len - 1);

% M系列信号を生成＆表示
msig = maximum_length_sequence(len, srnum);
subplot(3, 1, 1);

x = x * Adjust;

plot(x, msig);
title('１．M系列信号');

writematrix(msig)
type 'msig.csv'

% M系列信号の自己相関関数を生成＆表示
ac = auto_correlation(0:len, msig);
subplot(3, 1, 2);
plot(x(1:length(ac)), ac);
title('２．自己相関関数');


% パワースペクトルを表示
subplot(3, 1, 3);
[f, power] = disp_power_spectrum(msig);
plot(f, power);
title('３．パワースペクトル');