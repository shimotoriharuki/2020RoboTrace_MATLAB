function output = maximum_length_sequence(time, srnum)
    % time:����  srnum:�V�t�g���W�X�^��

    % �V�t�g���W�X�^�̐����́Axor�̃^�b�v�ʒu�i�Ō�̃V�t�g���W�X�^�ƁA�ǂꂩ�̃V�t�g���W�X�^��xor�j
    eachtap = [1 0 0 0 0 0 0 0 0;
               1 1 0 0 0 0 0 0 0;
               1 0 1 0 0 0 0 0 0;
               1 0 0 1 0 0 0 0 0;
               0 1 0 0 1 0 0 0 0;
               1 0 0 0 0 1 0 0 0;
               1 0 0 0 0 0 1 0 0;
               0 0 0 0 0 0 0 0 0; % �V�t�g���W�X�^����8�̎��́Axor1�݂̂ł́in^2-1�����̐M���𐶐��ł��Ȃ��j
               0 0 0 1 0 0 0 0 1];
    z = eachtap(srnum, 1:srnum); % �I�������V�t�g���W�X�^�̐��ɍ��킹��xor�̃^�b�v���𒊏o
    postap = find(z==1, 1);      % �Ō�̃V�t�g���W�X�^�ȊO�̃^�b�v�ʒu�𒊏o
    output = 0;

    for i = 1 : time

        output(i) = xor(z(postap), z(srnum));

        % ���ꂼ��̃V�t�g���W�X�^�̏o�͂��X�V
        for j = srnum : -1 : 2

            z(j) = z(j - 1);
        end
        z(1) = output(i); % xor�o�͂ƒ��ڌq����V�t�g���W�X�^�̂݁Axor�̏o�͂ŏ�����
    end

    output(output == 0) = -1; % -1��1�̓�l�M���ɂ��邽�߁A0��-1�ɒu��

%     plot(0:length(output) - 1, output); % �e�X�g�p

end