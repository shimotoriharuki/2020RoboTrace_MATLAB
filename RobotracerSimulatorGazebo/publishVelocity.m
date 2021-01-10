function publishVelocity(linear_vel, angular_vel)
   [cmd_vel_pub, vel_msg] = rospublisher('/cmd_vel', 'geometry_msgs/Twist');
   
   vel_msg.Linear.X = linear_vel;
   vel_msg.Angular.Z = angular_vel;
    
   send(cmd_vel_pub, vel_msg);
end