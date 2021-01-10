%% イニシャライズa
clear
rosshutdown;
% rosinit("192.168.0.30", 11311);
rosinit("192.168.0.58", 11311);

%% メッセージを作成する
global cmd_vel_pub;
global cmd_vel_msg;
[cmd_vel_pub, vel_msg] = rospublisher('/cmd_vel', 'geometry_msgs/Twist');
cmd_vel_msg = rosmessage(cmd_vel_pub);

vel_msg.Linear.X = 0.5;
vel_msg.Angular.Z = -0.5;


%% rosrate
desiredRate = 20;
rate = robotics.Rate(desiredRate);
rate.OverrunAction = 'drop';

reset(rate)
while rate.TotalElapsedTime < 5
   send(cmd_vel_pub, vel_msg)
   waitfor(rate);
end

vel_msg.Linear.X = 0;
vel_msg.Angular.Z = 0;
send(cmd_vel_pub, vel_msg)
%% タイマースタート
%{
t = timer;
t.TimerFcn = @cb_publish_velocity;
t.Period = 0.1;
t.ExecutionMode = 'fixedDelay';

start(t)


%% タイマー削除
delete(t)
%}

