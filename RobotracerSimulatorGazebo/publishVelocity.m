function publishVelocity(pub, msg, linear_vel, angular_vel)
   
   msg.Linear.X = linear_vel;
   msg.Angular.Z = angular_vel;
    
   send(pub, msg);
end