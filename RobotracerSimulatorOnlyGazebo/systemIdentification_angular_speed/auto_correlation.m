function yout = auto_correlation(xin, yin)

    T = length(xin)/2;

    % �т����������炵�Ă���
    for a = 1 : T % a = �� �̂���

        s = 0;

        for t = 2 : T % �т����l���炵����ԂŁA2�̔g�`�̐ς����߂�it = time�j

            s = s + yin(t) * yin(t + a); % �E�̎����}2/T�͈̔͂Œ�ϕ��Fx(t)x(t+��)dt
        end

        yout(a) = s; % x(t)���т̕��������炵�����̐ώZ�l���i�[
    end

    yout = yout / T;

%     plot(xin(1:length(yout)), yout);
end