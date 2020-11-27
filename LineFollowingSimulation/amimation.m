%2Sensor LineFollowing plot

clf

Rx = out.RobotPos(:, 1);
Ry = out.RobotPos(:, 2);
th = out.RobotPos(:, 3);

Sens_x_L = out.SensPosLeft(:, 1);
Sens_y_L = out.SensPosLeft(:, 2);
Sens_x_R = out.SensPosRight(:, 1);
Sens_y_R = out.SensPosRight(:, 2);

num = numel(Rx);

img = imread('CoursePic/1000Cross.png');

hold on
image([0, 1000],[0, 1000],img);

p = plot(Rx(1), Ry(1),'+','MarkerFaceColor','green');
p1 = plot(Sens_x_L(1), Sens_y_L(1),'o','MarkerFaceColor','red');
p2 = plot(Sens_x_R(1), Sens_y_R(1),'o','MarkerFaceColor','red');

hold off

axis equal
xlim([0, 1000])
ylim([0, 1000])


for i = 1 : num
    p.XData = Rx(i, 1);
    p.YData = Ry(i, 1);
    
    p1.XData = Sens_x_L(i, 1);
    p1.YData = Sens_y_L(i, 1);
    
    p2.XData = Sens_x_R(i, 1);
    p2.YData = Sens_y_R(i, 1);
 
    if rem(i, 1) == 0
        drawnow ;
    end
end


% legend('x', 'y', 'θ');