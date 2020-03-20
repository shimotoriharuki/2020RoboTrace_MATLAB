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
    HatPosition = GetDR_Position(PrePosition, u); % This is including DR error
    
    At = CalcAt(PrePosition, u);
    Wt = CalcWt(PrePosition, u);

    HatPt = At * PrePt * At' + Wt * Rt * Wt'; % Calclation estmation errors covariance matrix
    
    % Update step
    ObsZt = GetAngleForIMU(PreZt, velo(2)); % Get Robot's angle for gyro or geomagnetism
    St = Ht * HatPt * Ht' + Qt; % Covariance of observation residuals
    Kt = St \ (HatPt * Ht'); % Calclation Kalman constant
    HatPosition = HatPosition'; % Transpose matrix
    EstPosition = HatPosition + Kt * (ObsZt - Ht * HatPosition); % Calclation estimation position
    EstPt = (eye(size(EstPosition,1)) - Kt * Ht) * HatPt;  % Updata estmation errors covariance matrix
    
end