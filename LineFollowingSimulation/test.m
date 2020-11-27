x1 = 50;
y1 = 50;
x2 = 0;
y2 = 0;


fcn(x1, y1, x2, y2);

function [ad1, ad2] = fcn(x1, y1, x2, y2)
map = load('CrossMap.mat');
map = map.Pixels;
MaxNum_x = numel(map(1, :));
MaxNum_y = numel(map(:, 1));

SensRange = 5; %できれば奇数

Trimming1 = zeros(SensRange, SensRange);

for i = 1 : SensRange
    for j = 1 : SensRange
        
        if ceil((x1 - SensRange / 2 + j > 0)) && ceil((x1 + SensRange / 2 + j < MaxNum_x)) && ceil((y1 - SensRange / 2 + i > 0)) && ceil((y1 - SensRange / 2 + i < MaxNum_y))
            Trimming1(i, j) = map(ceil((x1 - SensRange / 2) + j), ceil((y1 - SensRange / 2) + i));
        else
            Trimming1(i, j) = NaN(1);
        end
        
    end
end

Trimming1
ad1 = mean(Trimming1, 'all')

end

