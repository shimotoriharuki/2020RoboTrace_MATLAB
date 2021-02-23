%GetFlag.m

function flag = GetFlag(position, searchRange, num)
    flag = zeros(1, num);
    storePosition = NaN(num, 2);
    for i = 1 : num
        storePosition(i, :) = position(i, :);
        Idx = my_rangesearch(storePosition, storePosition(i, :), searchRange);
        Outlier = isoutlier(Idx); % 外れ値を検知する
        Sum = sum(Outlier, 'all'); %すべて足す
        flag(i) = ge(Sum, 1); % 1以上だったら交差している
    end
end
