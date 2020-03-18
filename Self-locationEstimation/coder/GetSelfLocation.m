function [EstPosition, EstPt, ObsZt] = GetSelfLocation(PrePosition, PrePt, PreZt, velo)
    % Init
    global ErrerParameter;
    global Qt;
      
    At = [0, 0, 0;
          0, 0, 0;
          0, 0, 0];
      
    Wt = [0, 0;
          0, 0;
          0, 0];
    
    Ht = [0, 0, 1];
    
    % Calclation start
    u = CalcU(velo); % Calclate dS & dTh
    Rt = CalcRt(ErrerParameter, u); % The process noise covariance matrix
    
    % Forecast step
    DR_Position = GetDR_Position(PrePosition, u); % This is including DR error
    
    At = CalcAt(PrePosition, u);
    Wt = CalcWt(PrePosition, u);

    EstPt = At * PrePt * At' + Wt * Rt * Wt'; % Calclation estmation errors covariance matrix
    
    % Update step
    ObsZt = GetAngleForIMU(PreZt, velo(2)); % Get Robot's angle for gyro or geomagnetism
    St = Ht * EstPt * Ht' + Qt; % Covariance of observation residuals
    Kt = St \ (EstPt * Ht'); % Calclation Kalman constant
    DR_Position = DR_Position'; % Transpose matrix
    EstPosition = DR_Position + Kt * (ObsZt - Ht * DR_Position); % Calclation estimation position
    EstPt = (eye - Kt * Ht) * EstPt;  % Updata estmation errors covariance matrix
    
end