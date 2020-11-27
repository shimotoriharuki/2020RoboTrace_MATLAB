srnum = 7; % シフトレジスタの数。これにより出力信号の周期が設定される
helz = 2^srnum - 1; % 周期
% helz = 0.1; % 周期
len = 50; % 長さ
Adjust = 350;
x = 0 : (len - 1);
% PulseWidth = 500;

% M系列信号を生成＆表示
msig = maximum_length_sequence(len, srnum);
subplot(3, 1, 1);

x = x * Adjust;

plot(x, msig);
title('１．M系列信号');

writematrix(msig)
type 'msig.txt'

% M系列信号の自己相関関数を生成＆表示
ac = auto_correlation(0:len, msig);
subplot(3, 1, 2);
plot(x(1:length(ac)), ac);
title('２．自己相関関数');


% M系列の周期毎に縦線を表示（自己相関関数が妥当か、の確認のため）
%{
hold on
    for i = 1 : len

        if helz * i <= (len/2)

            plot([helz*i helz*i] - 1, [min(ac) max(ac)], 'r--'); % x軸の-1は、ズレる分の補正(黒線は'k')
        else

            break;
        end
    end
hold off
%}
% パワースペクトルを表示
subplot(3, 1, 3);
[f, power] = disp_power_spectrum(msig);
plot(f, power);
title('３．パワースペクトル');