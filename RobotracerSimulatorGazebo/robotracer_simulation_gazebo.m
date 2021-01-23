%% イニシャライズ
clear
rosshutdown;
% rosinit("192.168.0.30", 11311);
rosinit("192.168.0.58", 11311);
disp('------------初期化完了---------------');

%% 
[cmd_vel_pub, vel_msg] = rospublisher('/cmd_vel', 'geometry_msgs/Twist');
odom_sub = rossubscriber('/odom');

%% rosrate
desiredRate = 20; %Hz
rate = robotics.Rate(desiredRate);
rate.OverrunAction = 'drop';

t = 0;
poses = zeros(1, 100);
idx = 1;
reset(rate)
while rate.TotalElapsedTime < 5
    linear = 0.5;
    angular = 0.2 + sin(t);
    
    publishVelocity(cmd_vel_pub, vel_msg, linear, angular);
    waitfor(rate);
    
    t = t + 0.2;
    if t >= 2 * pi
        t = 0;
    end

    msg = receive(odom_sub, 3);
    pose.x = msg.Pose.Pose.Position.X;
    pose.y = msg.Pose.Pose.Position.Y;
    pose.z = msg.Pose.Pose.Position.Z;
    poses(idx) = {[pose.x, pose.y, pose.z]};
    idx = idx + 1;
end
%%
% Robot runnning stop
publishVelocity(cmd_vel_pub, vel_msg, 0.0, 0.0);
