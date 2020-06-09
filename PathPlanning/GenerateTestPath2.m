clear
% clf
%-----------生データ生成-----------%
%{
SampleNum = 300;
theta = linspace(0, 1.1 * pi, SampleNum);

funcX = @(th) 100 * sin(3 * th);
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
for i = 1 : SampleNum
    Position(i, 1) = funcX(theta(i));
    Position(i, 2) = funcY(theta(i));
end
%}

% FileName = 'CouseData/2019AllJapan.txt';
% FileName = 'CouseData/2019Student.txt';
FileName = 'CouseData/2019East.txt';
% FileName = 'CouseData/2019Kansai_points.txt'; %??
% FileName = 'CouseData/2018student_points.txt';
% FileName = 'CouseData/2018alljapan_points.txt';
% FileName = 'CouseData/2017alljapan_points.txt';
% FileName = 'CouseData/2016alljapan_points.txt';
% FileName = 'CouseData/2015alljapan_points.txt';


Position = readmatrix(FileName); %[m}
OneGridScale = 1e2; %[cm]
Position = Position * OneGridScale; 

figure(1)
scatter(Position(:, 1), Position(:, 2));
axis equal

% --------------交差フラグテーブルを生成--------------%
FlagMargin = 0.3 * OneGridScale;
SearchRange = 0.03 * OneGridScale;
Flag = GetCrossFlagTable(Position, FlagMargin, SearchRange);

% --------------ショートカットパスを生成----------------------%
ExpansionLength = 0.1; %拡張する大きさ[m]
ExpansionLength = ExpansionLength * OneGridScale;
NumNodes = 100;
ConnectionDistance = 2;
[ShortcutPath, SaveBineryMap] = GetShortcutPath(Position, Flag, ExpansionLength, OneGridScale, NumNodes, ConnectionDistance);


%--------------Functions-------------%
function flagTable = GetCrossFlagTable(position, flagMargin, searchRange)
    positionNum = numel(position(:, 1));
    storePosition = zeros(positionNum, 2);
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

function [path, saveBinaryMap] = GetShortcutPath(position, flag, expansionLength, oneGridScale, numNodes, connectionDistance)
    positionNum = numel(position(:, 1));
    
    %----------グリッドマップ初期化-----------%
    MaxPositions = max(position);
    MinPositions = min(position);
    MaxPosition = ceil(MaxPositions);   % 正に丸める
    MinPosition = floor(MinPositions);  % 負に丸める

    MapElements_x = (MaxPosition(1) - MinPosition(1)); % [cm]
    MapElements_y = (MaxPosition(2) - MinPosition(2)); % [cm]
    GridMap = ones(MapElements_y, MapElements_x); % 1マス1[cm]のグリッドマップ　
    saveGridMap = ones(MapElements_y, MapElements_x); % figureで表示するためだけのマップ。実際は必要ない


    GridMapOrigine = [position(1, 1) + abs(MinPosition(1)), position(1, 2) + abs(MinPosition(2))];
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
    
    ExpansionHalf = ceil(expansionLength / 2);
    startLocation = GridMapOrigine;
%     startLocation = [position(1, 1) + abs(MinPosition(1)), position(1, 2) + abs(MinPosition(2))]; % 丸めていない生のポジション
    shortcutPath = NaN(positionNum, 2);
    shortcutPath(1, :) = startLocation / oneGridScale; 
    ignoreFlag = 0;
    PathNum = 1;
    %------生の位置データをグリッドマップに変換-----------%
    for i = 1 : positionNum 
        % 各位置を四捨五入して整数にする
        x = ceil(position(i, 1)) + abs(MinPosition(1)); % 生データをグリッド座標に写すためにオフセットする
        y = ceil(position(i, 2)) + abs(MinPosition(2));
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
        for j = 1 : expansionLength + 1
            Yref = MapElements_y - (y - (ExpansionHalf + 1)  + j); %行列は左上から数えられてしまうので左下からに変換

            if Yref >= 1 && Yref <= MapElements_y
                for k = 1 : expansionLength + 1
                    Xref = x - (ExpansionHalf + 1)  + k; 
                    if Xref >= 1 && Xref <= MapElements_x
                        GridMap(Yref, Xref) = 0;
                        saveGridMap(Yref, Xref) = 0;
                    end
                end
            end

        end

        % 最短経路を探す
        if (ignoreFlag == 1 && flag(i) == 0) || i >= positionNum % 一回交差したら交差しなくなるか終わるまで処理を無視 
            ignoreFlag = 0;
        end
        if  ignoreFlag == 0 && flag(i) == 1  || i >= positionNum % 交差したか終わったら最短経路を探す
            endLocation = [position(i, 1) + abs(MinPosition(1)), position(i, 2) + abs(MinPosition(2))]; % 丸めていない生のポジション
            BinaryMap = binaryOccupancyMap(GridMap, oneGridScale);
            [tempPath, prm] = GetPath(BinaryMap, startLocation/oneGridScale, endLocation/oneGridScale, numNodes, connectionDistance);

            for n = 1 : numel(tempPath(:, 1))
                shortcutPath(PathNum, :) = tempPath(n, :);
                PathNum = PathNum + 1;
            end
            startLocation = endLocation;
            ignoreFlag = 1;

            figure(2)
            show(BinaryMap)
            show(prm)
            
            GridMap = ones(MapElements_y, MapElements_x); % 1マス10[mm]のグリッドマップ　
%             GridMap() = 1;   % 
    
        end
    end
    
    shortcutPath = rmmissing(shortcutPath); %NuNを削除
    path = shortcutPath;
    
    figure(3)
    hold on
    saveBinaryMap = binaryOccupancyMap(saveGridMap, oneGridScale);
    show(saveBinaryMap)
    animatedline(shortcutPath(:, 1), shortcutPath(:, 2), 'Color', 'red', 'LineWidth', 1);
    animatedline((position(:, 1) + abs(MinPosition(1))) / oneGridScale, (position(:, 2) + abs(MinPosition(2))) / oneGridScale, 'Color', 'blue', 'LineWidth', 1);
end

function [path, prm] = GetPath(BinaryMap, startLocation, endLocation, numNodes, connectionDistance)
    %----------PRM設定-----------%
    prm = robotics.PRM(BinaryMap);
    prm.NumNodes = numNodes;
    prm.ConnectionDistance = connectionDistance;
    
    %---------パス生成-----------%
    TF = 0;
    counter = 0;
    while 1
        path = findpath(prm, startLocation, endLocation);
        counter = counter + 1
        if TF == isempty(path)
            break;
        end
        if counter >= 100
            error = 1;
            break;
        end 
        prm.NumNodes = prm.NumNodes + 100;

    end
end