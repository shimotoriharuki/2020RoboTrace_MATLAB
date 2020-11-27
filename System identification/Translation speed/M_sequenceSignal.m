srnum = 7; % �V�t�g���W�X�^�̐��B����ɂ��o�͐M���̎������ݒ肳���
helz = 2^srnum - 1; % ����
% helz = 0.1; % ����
len = 50; % ����
Adjust = 350;
x = 0 : (len - 1);
% PulseWidth = 500;

% M�n��M���𐶐����\��
msig = maximum_length_sequence(len, srnum);
subplot(3, 1, 1);

x = x * Adjust;

plot(x, msig);
title('�P�DM�n��M��');

writematrix(msig)
type 'msig.txt'

% M�n��M���̎��ȑ��֊֐��𐶐����\��
ac = auto_correlation(0:len, msig);
subplot(3, 1, 2);
plot(x(1:length(ac)), ac);
title('�Q�D���ȑ��֊֐�');


% M�n��̎������ɏc����\���i���ȑ��֊֐����Ó����A�̊m�F�̂��߁j
%{
hold on
    for i = 1 : len

        if helz * i <= (len/2)

            plot([helz*i helz*i] - 1, [min(ac) max(ac)], 'r--'); % x����-1�́A�Y���镪�̕␳(������'k')
        else

            break;
        end
    end
hold off
%}
% �p���[�X�y�N�g����\��
subplot(3, 1, 3);
[f, power] = disp_power_spectrum(msig);
plot(f, power);
title('�R�D�p���[�X�y�N�g��');