function flagTable = GetCrossFlagTable(position, flagMargin, searchRange)
    positionNum = numel(position(:, 1));
    storePosition = NaN(positionNum, 2);
    Sum = zeros(1, positionNum);
    Flag = zeros(1, positionNum);
    for i = 1 : positionNum
        storePosition(i, :) = position(i, :);
        Idx = my_rangesearch(storePosition, storePosition(i, :), searchRange); % 現在の点の周囲の点を探索  
        Outlier = isoutlier(Idx); % 外れ値検知
             
        Sum(i) = sum(Outlier, 'all'); 
        Flag(i) = ge(Sum(i), 1); % 交差しているかフラグ
    end
    
    % 白線を拡大した分、交差フラグをある程度前後に発生させる
    for i = 1 : positionNum
        if Flag(i) == 1
           for j = 1 : flagMargin
               if i - flagMargin >= 1
                    Flag(i - flagMargin) = 1;
               end
           end
        end
    end
    
    flagTable = Flag;
end