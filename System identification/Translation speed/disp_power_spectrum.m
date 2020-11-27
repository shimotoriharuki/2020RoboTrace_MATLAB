function [f, power] = disp_power_spectrum(sig)

    fs = 1; % �ш�
    y = fft(sig);

    n = length(sig);       % �T���v����
    f = (0:n-1) * (fs/n);  % �\�����g��
    power = abs(y) .^ 2/n; % ���U�t�[���G�ϊ�

    % plot(f,power)
    grid on;
end