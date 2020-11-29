%% ROS init
clear
rosshutdown;
rosinit("192.168.0.30", 11311);


%% パブリッシュメッセージを作成する
cmd_vel_pub = rospublisher('/cmd_vel', 'geometry_msgs/Twist');
cmd_vel_msg = rosmessage(cmd_vel_pub);

%% サブスクライバーを作成する
odom_sub = rossubscriber('/odom');
pause(1);

dt = 0.002; % [s]
sim_time = 1; % [s]
for t = 1 : sim_time / dt
    test = t
    pause(dt);
end