clear
clf

%-----------生データ生成-----------%
SampleNum = 300;
theta = linspace(0, 1.5 * pi, SampleNum);

funcX = @(th) 100 * sin(1 * th);
funcY = @(th) 100 * sin(2 * th);

%{
funcX = @(th) 100 * sin(1 * th);
funcY = @(th) 100 * cos(1 * th);
%}
%{
funcX = @(th) 100 * th;
funcY = @(th) 20 * sin(5 * th);
%}

Position = zeros(SampleNum, 2); % [cm]
Idx = zeros(1, SampleNum);
Sum = zeros(1, SampleNum);
Flag = zeros(1, SampleNum);
for i = 1 : SampleNum
    Position(i, 1) = funcX(theta(i));
    Position(i, 2) = funcY(theta(i));
%     Position(i, 3) = i;
    Idx = rangesearch(Position, Position(i, :), 20); % 現在の点の周囲の点を探索
    Outlier = isoutlier(Idx{1, 1}); % 外れ値検知
    Sum(i) = sum(Outlier, 'all'); 
    Flag(i) = ge(Sum(i), 1); % 交差しているかフラグ
end

% 白線を拡大した分、交差フラグをある程度前から発生させる
FlagMargin = 10;
for i = 1 : SampleNum
    if Flag(i) == 1
       for j = 1 :  FlagMargin
           if i - FlagMargin >= 1
                Flag(i - FlagMargin) = 1;
           end
       end
    end
end

figure(1)
scatter(Position(:, 1), Position(:, 2));
axis equal

%----------グリッドマップ初期化-----------%
MaxPositions = max(Position);
MinPositions = min(Position);
MaxPosition = ceil(MaxPositions);   % 正に丸める
MinPosition = floor(MinPositions);  % 負に丸める

MapElements_x = (MaxPosition(1) - MinPosition(1)); % [cm]
MapElements_y = (MaxPosition(2) - MinPosition(2)); % [cm]
GridMap = ones(MapElements_y, MapElements_x); % 1マス10[mm]のグリッドマップ　

GridMapOrigine = [ceil(Position(1, 1)) + abs(MinPosition(1)), ceil(Position(1, 2)) + abs(MinPosition(2))];
%xとyを丸めてマップ外になってしまったときに修正
if GridMapOrigine(1, 1) <= 1
    GridMapOrigine(1, 1) = 1;
elseif GridMapOrigine(1, 1) >= MapElements_x
    GridMapOrigine(1, 1) = MapElements_x;
end
if GridMapOrigine(1, 2) <= 1
    GridMapOrigine(1, 2) = 1;
elseif GridMapOrigine(1, 2) >= MapElements_y
    GridMapOrigine(1, 2) = MapElements_y;
end

% GridMapOrigine = [abs(MinPosition(1))+1, abs(MinPosition(2))+1];
ExpansionLength = 30;
ExpansionHalf = ceil(ExpansionLength / 2);
startLocation = GridMapOrigine;
ShortcutPath = NaN(SampleNum, 2);
ShortcutPath(1, :) = startLocation / 100; %[m]
ignoreFlag = 0;
PathNum = 1;
%------生の位置データをグリッドマップに変換-----------%
for i = 1 : SampleNum 
    % 各位置を四捨五入して整数にする
    x = ceil(Position(i, 1)) + abs(MinPosition(1)); % 生データをグリッド座標に写すためにオフセットする
    y = ceil(Position(i, 2)) + abs(MinPosition(2));
    %xとyを丸めてマップ外になってしまったときに修正
    if x <= 1
        x = 1;
    elseif x >= MapElements_x
        x = MapElements_x;
    end
    if y <= 1
        y = 1;
    elseif y >= MapElements_y
        y = MapElements_y;
    end
    
    % 白線を膨張させる
    for j = 1 : ExpansionLength + 1
        Yref = MapElements_y - (y - (ExpansionHalf + 1)  + j); %行列は左上から数えられてしまうので左下からに変換
        
        if Yref >= 1 && Yref <= MapElements_y
            for k = 1 : ExpansionLength + 1
                Xref = x - (ExpansionHalf + 1)  + k; 
                if Xref >= 1 && Xref <= MapElements_x
                    GridMap(Yref, Xref) = 0;
                end
            end
        end
        
    end

    % 最短経路を探す
    if (ignoreFlag == 1 && Flag(i) == 0) || i >= SampleNum % 一回交差したら交差しなくなるか終わるまで処理を無視 
        ignoreFlag = 0;
    end
    if  ignoreFlag == 0 && Flag(i) == 1  || i >= SampleNum % 交差したか終わったら最短経路を探す
        endLocation = [x, y];
        BinaryMap = binaryOccupancyMap(GridMap, 100);
        [tempPath, prm] = GetPath(BinaryMap, startLocation/100, endLocation/100);
        
%         ShortcutPath = vertcat(ShortcutPath, tempPath);

        for n = 1 : numel(tempPath(:, 1))
            ShortcutPath(PathNum, :) = tempPath(n, :);
            PathNum = PathNum + 1;
        end
        startLocation = endLocation;
        ignoreFlag = 1;

        figure(2)
        show(BinaryMap)
        show(prm)
        
        
    end
end

% GridMap = imcomplement(GridMap); %Convert to inverse bit
% figure(2)
% show(BinaryMap)
% show(prm)
% imshow(GridMap)

ShortcutPath = rmmissing(ShortcutPath); %NuNを削除
figure(3)
hold on
show(BinaryMap)
a1 = animatedline(ShortcutPath(:, 1), ShortcutPath(:, 2), 'Color', 'red', 'LineWidth', 1);
a2 = animatedline((Position(:, 1) + abs(MinPosition(1))) / 100, (Position(:, 2) + abs(MinPosition(2))) / 100, 'Color', 'blue', 'LineWidth', 1);

%{
for i = 1 : numel(ShortcutPath(:, 1))
    addpoints(a1, ShortcutPath(i, 1), ShortcutPath(i, 2));
    drawnow 
end
%}

% scatter(ShortcutPath(:, 1), ShortcutPath(:, 2));

%{
BW1 = edge(GridMap, 'Canny');
figure(3)
imshow(BW1)
%}

function [path, prm] = GetPath(BinaryMap, startLocation, endLocation)
    %----------PRM設定-----------%
    prm = robotics.PRM(BinaryMap);
    prm.NumNodes = 300;
    prm.ConnectionDistance = 30;
    
    %---------パス生成-----------%
    path = findpath(prm, startLocation, endLocation);
end