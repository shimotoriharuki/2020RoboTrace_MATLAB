%% ROS init
clear
rosshutdown;
rosinit("192.168.0.30", 11311);

%% メッセージを作成する
cmd_vel_pub = rospublisher('/cmd_vel', 'geometry_msgs/Twist');
cmd_vel_msg = rosmessage(cmd_vel_pub);

%% メッセージをパプリッシュする
cmd_vel_msg.Linear.X = 1.0;
cmd_vel_msg.Angular.Z = 1.0;

send(cmd_vel_pub, cmd_vel_msg);

%% サブスクライバーを作成する

close all
%global tftree 
poses = 0;

odom_sub = rossubscriber('/odom', {@odomCallback, poses});
%odom_tf = rossubscriber('/tf', @tfCallback);
pause(1);


%% メッセージをサブスクライブする
msg = receive(odom_sub, 3);

pose.x = msg.Pose.Pose.Position.X;
pose.y = msg.Pose.Pose.Position.Y;
pose.z = msg.Pose.Pose.Position.Z;

pose


%% 停止させる
cmd_vel_msg.Linear.X = 0.0;
cmd_vel_msg.Angular.Z = 0.0;

send(cmd_vel_pub, cmd_vel_msg);

%% ROSシャットダウン
rosshutdown

%% call back functions
function odomCallback(poses, message)
    poses.x = message.Pose.Pose.Position.X;
    poses.y = message.Pose.Pose.Position.Y;
    poses.z = message.Pose.Pose.Position.Z;
    
    hold on
    axis equal
    scatter(poses.x, poses.y, 'r.');

end
