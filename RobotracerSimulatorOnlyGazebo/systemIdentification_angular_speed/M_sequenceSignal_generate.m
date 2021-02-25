srnum = 7; % �V�t�g���W�X�^�̐��B����ɂ��o�͐M���̎������ݒ肳��� ����X
helz = 2^srnum - 1; % ����
% helz = 0.1; % ����
len = 200; % �����@�f�[�^�������Ȃ�
Adjust = 0.1; % ���v���Ԃ����킹��
x = 0 : (len - 1);

% M�n��M���𐶐����\��
msig = maximum_length_sequence(len, srnum);
subplot(3, 1, 1);

x = x * Adjust;

plot(x, msig);
title('�P�DM�n��M��');

writematrix(msig)
type 'msig.csv'

% M�n��M���̎��ȑ��֊֐��𐶐����\��
ac = auto_correlation(0:len, msig);
subplot(3, 1, 2);
plot(x(1:length(ac)), ac);
title('�Q�D���ȑ��֊֐�');


% �p���[�X�y�N�g����\��
subplot(3, 1, 3);
[f, power] = disp_power_spectrum(msig);
plot(f, power);
title('�R�D�p���[�X�y�N�g��');