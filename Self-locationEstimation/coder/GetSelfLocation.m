function [EstPosition, EstPt, ObsZt] = GetSelfLocation(PrePosition, PrePt, PreZt, velo)
    % --------------------Init------------------%
    global ErrerParameter;
    global Qt;
      
    At = [0, 0, 0;
          0, 0, 0;
          0, 0, 0];
      
    Wt = [0, 0;
          0, 0;
          0, 0];
    
    Ht = [0, 0, 1];
    
    %---------------------- Calclation start----------------------------%
    % Calclate dS & dTh
    u = CalcU(velo); 
    
    % The process noise covariance matrix
    Rt = CalcRt(ErrerParameter, u); 
    
    %----------------------- Forecast step----------------------%
    % This is including DR error
    HatPosition = GetDR_Position(PrePosition, u); 
    
    % Calclation At & Wt
    At = CalcAt(PrePosition, u);
    Wt = CalcWt(PrePosition, u);

    % Calclation estmation errors covariance matrix
    HatPt = At * PrePt * At' + Wt * Rt * Wt'; 
    
    %------------ Update step^^^^^^^^^^%
    % Get Robot's angle for gyro or geomagnetism
    ObsZt = GetAngleForIMU(PreZt, velo(2)); 
    
    % Covariance of observation residuals
    St = Ht * HatPt * Ht' + Qt; 
    
    % Calclation Kalman constant
    Kt = St \ (HatPt * Ht');
    
    % Transpose matrix
    HatPosition = HatPosition';
    
    % Calclation estimation position
    EstPosition = HatPosition + Kt * (ObsZt - Ht * HatPosition); 
    
    % Updata estmation errors covariance matrix
    EstPt = (eye(size(EstPosition, 1)) - Kt * Ht) * HatPt; 
    
end