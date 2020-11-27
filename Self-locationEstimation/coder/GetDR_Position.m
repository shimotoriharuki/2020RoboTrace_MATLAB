function position = GetDR_Position(PrePosition, u)
    % This is rewritten to the robot odometry program
    global ErrerParameter;
    
    Rt = CalcRt(ErrerParameter, u); % the process noise covariance matrix
    
    u(1) = u(1) + randn() * sqrt(Rt(1, 1));
    u(2) = u(2) + randn() * sqrt(Rt(2, 2));
    
    position = CalcPosition(PrePosition, u); 
end