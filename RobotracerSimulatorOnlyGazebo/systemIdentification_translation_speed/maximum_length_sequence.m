function output = maximum_length_sequence(time, srnum)
    % time:時間  srnum:シフトレジスタ数

    % シフトレジスタの数毎の、xorのタップ位置（最後のシフトレジスタと、どれかのシフトレジスタのxor）
    eachtap = [1 0 0 0 0 0 0 0 0;
               1 1 0 0 0 0 0 0 0;
               1 0 1 0 0 0 0 0 0;
               1 0 0 1 0 0 0 0 0;
               0 1 0 0 1 0 0 0 0;
               1 0 0 0 0 1 0 0 0;
               1 0 0 0 0 0 1 0 0;
               0 0 0 0 0 0 0 0 0; % シフトレジスタ数が8の時は、xor1つのみでは（n^2-1周期の信号を生成できない）
               0 0 0 1 0 0 0 0 1];
    z = eachtap(srnum, 1:srnum); % 選択したシフトレジスタの数に合わせたxorのタップ数を抽出
    postap = find(z==1, 1);      % 最後のシフトレジスタ以外のタップ位置を抽出
    output = 0;

    for i = 1 : time

        output(i) = xor(z(postap), z(srnum));

        % それぞれのシフトレジスタの出力を更新
        for j = srnum : -1 : 2

            z(j) = z(j - 1);
        end
        z(1) = output(i); % xor出力と直接繋がるシフトレジスタのみ、xorの出力で初期化
    end

    output(output == 0) = -1; % -1と1の二値信号にするため、0を-1に置換

%     plot(0:length(output) - 1, output); % テスト用

end