function Index = my_rangesearch(Data, Origin, Range)
    temp = NaN(1, numel(Data));
    cnt = 1;
    for i = 1 : numel(Data(:, 1))
        diff = Origin - Data(i, :);
        Length = sqrt(diff(1 ,1)^2 + diff(1, 2)^2);
        
        if Length <= Range
            temp(cnt) = i;
            cnt = cnt + 1;
        end
    end
    Index = temp;
end