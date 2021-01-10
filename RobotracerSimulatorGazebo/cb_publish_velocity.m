function cb_publish_velocity(~, ~)
    global cmd_vel_pub;
    global cmd_vel_msg;
%     global t;

%     t = t + 0.1;
%     if t >= 2 * pi
%         t = 0;
%     end
    
    lenear_vel = 0.9;
    angular_vel = 0.6 + sin(0);
    
    cmd_vel_msg.Linear.X = lenear_vel;
    cmd_vel_msg.Angular.Z = angular_vel;

    send(cmd_vel_pub, cmd_vel_msg);
    

end