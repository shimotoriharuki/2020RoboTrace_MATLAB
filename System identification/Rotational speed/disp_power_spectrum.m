function [f, power] = disp_power_spectrum(sig)

    fs = 1; % 帯域
    y = fft(sig);

    n = length(sig);       % サンプル数
    f = (0:n-1) * (fs/n);  % 表示周波数
    power = abs(y) .^ 2/n; % 離散フーリエ変換

    % plot(f,power)
    grid on;
end