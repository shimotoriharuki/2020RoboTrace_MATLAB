%CircularSensor LineFollowing plot

clf
SensorNumber = evalin('base', 'SensorNumber');
SensorRange = evalin('base', 'SensorRange');
global FileName
img = imread(FileName);
info = imfinfo(FileName);

AllSensorNumer = SensorNumber * 2 + 1;

pos = out.SensPos.signals.values;
hold on
plot(0, 0, '*'); % origin
image([0, info.Width],[0, info.Height],img);

o = plot(out.RobotPos(1, 1), out.RobotPos(1, 2), '*'); % origin
for i = 1 : AllSensorNumer
    p(i) = plot(0, 0, 'o','MarkerFaceColor','red'); %プロットの構想体を得る
    c(i) = viscircles([0, 0], SensorRange/2, 'color', 'g', 'LineStyle', ':', 'LineWidth', 2); %円の構造体を得る
end
% xlim([200, 600]);
% ylim([400, 600]);
axis equal

for i = 1 : 51
    delete(c);
    for j = 1 : AllSensorNumer
        p(j).XData = pos(1, j, i);
        p(j).YData = pos(2, j, i);
        c(j) = viscircles([pos(1, j, i), pos(2, j, i)], SensorRange/2, 'color', 'g', 'LineStyle', ':', 'LineWidth', 2);
        
    end
    o.XData = out.RobotPos(i, 1);
    o.YData = out.RobotPos(i, 2);
    drawnow;
    
end

