function theta = GetAngleForIMU(PreTh, u) %Calclation angle by gyro
    % This is rewritten to the calclation IMU angle program    

    global Qt
    global dt
    
    theta = PreTh + (u * dt + normrnd(0, sqrt(Qt)));

end