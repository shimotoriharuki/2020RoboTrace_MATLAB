map = evalin('base', 'Pixels');
Filename = 'CoursePic/1000Straight.png';
img = imread(Filename);
info = imfinfo('CoursePic/1000Straight.png');

L = 0;
SensorRadius = 40;  % [mm]
SensorNumber = 3;   % Number of pieces excluding the center
SensorAngle = 60;   % One side angle[deg]
AngleBetweenSensor = deg2rad(SensorAngle / SensorNumber); %[rad]
SensorRange = 20; % [mm] % Diameter of circle
InitialPosition = [520 + L; 520];

AllSensorNumer = SensorNumber * 2 + 1;
SensPos = zeros(2, AllSensorNumer); %Initialization
CenterNumber = ceil(AllSensorNumer / 2); %Number of center sensor
SensPos(:, CenterNumber) = InitialPosition + [SensorRadius; 0]; % Position of center sensor

clf
th = 0;
for i = 1 : SensorNumber % 初期位置を設定
    th = th + AngleBetweenSensor;
    SensPos(:, CenterNumber + i) = [cos(th), -sin(th) ; sin(th), cos(th)] * (SensPos(:, CenterNumber) - InitialPosition) + InitialPosition;
    SensPos(1, CenterNumber - i) = SensPos(1, CenterNumber + i);
    SensPos(2, CenterNumber - i) = SensPos(2, CenterNumber) - (SensPos(2, CenterNumber + i) - SensPos(2, CenterNumber)); 
end
% scatter(SensPos(1, :), SensPos(2, :));

%------------その場で回転-------------%
Resolution = 100;
pos = zeros(2, AllSensorNumer, Resolution);
AD = zeros(AllSensorNumer, Resolution);
theta = linspace(-pi/2, pi/2, Resolution);
% theta = linspace(0, 0, Resolution);

for i = 1 : Resolution
    for j = 1 : AllSensorNumer
        pos(:, j, i) = [cos(theta(i)), -sin(theta(i)) ; sin(theta(i)), cos(theta(i))] * (SensPos(:, j) - InitialPosition) + InitialPosition;
        AD(j, i) = GetAD_value(map, pos(1, j, i), pos(2, j, i), SensorRange, info.Width, info.Height);
    end
    Angle(i) = GetAngle(AD(:, i), AngleBetweenSensor, CenterNumber, AllSensorNumer);
end

%---------------Plot--------------%
subplot(2, 1, 1);
hold on
image([0, info.Width],[0, info.Height],img);
plot(InitialPosition(1, 1), InitialPosition(2, 1), '*'); % origin
for i = 1 : AllSensorNumer
    p(i) = plot(0, 0, 'o','MarkerFaceColor','red'); %プロットの構想体を得る
    c(i) = viscircles([0, 0], SensorRange/2, 'color', 'g', 'LineStyle', ':', 'LineWidth', 2); %円の構造体を得る
end

xlim([500, 540]);
ylim([400, 700]);
axis equal

ColorTable = ['r', 'g', 'b', 'c', 'm', 'y', 'k']; %plotの色を作る
j = 0;
for i = 1 : AllSensorNumer
    j = j + 1;
    PlotColor(i) = ColorTable(j);
    if j >= 6
        j = 0;
    end
end
haxes = subplot(2, 1, 2);
h = animatedline(haxes);
hold on
for i = 1 : AllSensorNumer
    h = animatedline(haxes, 'Color', 'r');  %角度
%     h(i) = animatedline(haxes, 'Color', PlotColor(i));    %各センサー値
end

xlim([theta(1, 1), theta(1, end)]);
ylim([theta(1, 1), theta(1, end)]);

for i = 1 : Resolution
    subplot(2, 1, 1);
    delete(c);
    for j = 1 : AllSensorNumer
        p(j).XData = pos(1, j, i);
        p(j).YData = pos(2, j, i);
        c(j) = viscircles([pos(1, j, i), pos(2, j, i)], SensorRange/2, 'color', 'g', 'LineStyle', ':', 'LineWidth', 2);
    end
%     drawnow;
    
    
    subplot(2, 1, 2);
    %各センサ値
    %{
    for j = 1 : AllSensorNumer
        addpoints(h(j), theta(i), AD(j, i));
    end
    %}
    
    %角度
    grid on
    addpoints(h, theta(i), Angle(i));


    drawnow;
end


function ad  = GetAD_value(MapData, x, y, Range, xMax, yMax)
Trimming = zeros(Range, Range);

for i = 1 : Range
    for j = 1 : Range  
        if (x - ceil(Range / 2) + j > 0) && (x + ceil(Range / 2) + j < xMax) && (y -ceil( Range / 2) + i > 0) && (y - ceil(Range / 2) + i < yMax)
            Trimming(i, j) = MapData(ceil((y - Range / 2) + i), ceil((x - Range / 2) + j));
        else
            Trimming(i, j) = NaN(1);
        end  
    end
end

% Trimming
ad = mean(Trimming, 'all');

end

function angle = GetAngle(ad, AngleBetweenSensor_, CenterNumber_, AllSensorNumer_)
    [~, Index] = max(ad);
    
    if Index == 1
        NormAD = [0, ad(Index, 1) / ad(Index, 1), ad(Index + 1, 1) / ad(Index, 1)];
    elseif Index == AllSensorNumer_
        NormAD = [ad(Index - 1, 1) / ad(Index, 1), ad(Index, 1) / ad(Index, 1), 0];
    else
        NormAD = [ad(Index - 1, 1) / ad(Index, 1), ad(Index, 1) / ad(Index, 1), ad(Index + 1, 1) / ad(Index, 1)];
    end
    
    ratio = NormAD(1) -  NormAD(3);
    StandardAngle = (CenterNumber_ - Index(1, 1)) * AngleBetweenSensor_;
    DeltaTheta = (AngleBetweenSensor_ / 2)  * ratio;
    
    angle = StandardAngle + DeltaTheta;
    
end
