function theta = GetAngleForIMU(PreTh, u) %ジャイロから角度を計算した場合
    % This is rewritten to the calclation IMU angle program    

    global Qt
    global dt
    
    theta = PreTh + (u * dt + normrnd(0, sqrt(Qt)));
end