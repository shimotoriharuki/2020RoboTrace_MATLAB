%Observer is Geomagnetic sensor.

% --------------main-----------------%
% Initialize
hold off
clear all

% Simuration Init
time = 0;
ContinueTime = 6;  %[s]
global dt;
dt = 0.001;   %[s]
Step = ceil((ContinueTime - time) / dt);

% Machine parameter Init
global Tred ;
Tred = 126e-3;  %[m]

% Input parameter Init
Robot_u = [10, 1]; %[Transration(m/s), Rotation(m/s)]
input = [0, 0]; %[dS(m), dTh(rad)]

% error parameter Init
global sigma; 
sigma = [0, 0]; %[Transration, Rotation]
global Rt  %input error
Rt = [0, 0;
      0, 0];
  
global a;
a = [10, 10, 10, 10]; %[a1, a2, a3, a4]
global Qt %observe error
Qt = 0.5^2;

% Position init
TruePosition = [0, 0, 0];   %[x, y, th]
OdoPosition = [0, 0, 0];   %[x, y, th]
PreXt = [0, 0, 0];
EstXt = [0, 0, 0];
PreZt = 0;

% Dispersion init
EstPt = [0, 0, 0;
         0, 0, 0;
         0, 0, 0];
PrePt = [0, 0, 0;
      0, 0, 0;
      0, 0, 0];

% other
At = [0, 0, 0;
      0, 0, 0;
      0, 0, 0];
Wt = [0, 0;
      0, 0;
      0, 0];

% Simuration
for i = 1 : Step
    
    input = CalcU(Robot_u);
    Rt = CalcRt(a, input);  
    sigma = [Rt(1, 1), Rt(2, 2)];
    
    % Updata true position
    TruePosition = CalcTruePosition(TruePosition, input);   
    
    % Updata odometory position (add noise)
    OdoPosition = CalcPositionWithError(OdoPosition, input);
    
    % Forecast step
    EstXt = CalcPositionWithError(PreXt, input);
    At = CalcAt(PreXt, input);
    Wt = CalcWt(PreXt, input);
    
    PtPred = At * EstPt * At' + Wt * Rt * Wt';
    
    % Update step
    ObsZt = GetIMU(TruePosition);
    Ht = [0, 0, 1];
    St = Ht * PtPred * Ht' + Qt;
    Kt = St \ (PtPred * Ht');
    EstXt = EstXt';
    EstXt = EstXt + Kt * (ObsZt - Ht * EstXt);
    EstPt = (eye(size(EstXt,1)) - Kt * Ht) * PtPred;
%     EstXt = EstXt';
    
%     xlim([-5, 15]);
%     ylim([0 25]);
    % Animation
    if rem(i, 100)==0
%         subplot(2, 1, 1)
        plot(TruePosition(:, 1), TruePosition(:, 2),'.blue'); hold on;
        plot(OdoPosition(:, 1), OdoPosition(:, 2),'.black'); hold on;
        plot(PreXt(1), PreXt(2),'.red'); hold on;
        axis equal;
        legend('True', 'Odometry', 'EKF');
   
        drawnow
    end
%     subplot(2, 1, 2)
%     plot(time, Zt, '.blue'); hold on;
        
    PreXt = EstXt;
    PrePt = EstPt;
    PreZt = ObsZt;
end



% --------------Functions-----------------%
function out = CalcTruePosition(position, u) 
    out = CalcPosition(position, u);   
end

function  out = CalcPositionWithError(position, u)
    global sigma;
    
    ue(1) = u(1) + randn() * sigma(1);
    ue(2) = u(2) + randn() * sigma(2);
    
    out = CalcPosition(position, ue);   

end

function out = CalcPosition(position, u)
    pre.x = position(1);
    pre.y = position(2);
    pre.th = position(3);
    
    dS = u(1);
    dTh = u(2);
    
    x = pre.x + dS * cos(pre.th + dTh / 2);
    y = pre.y + dS * sin(pre.th + dTh / 2);
    th = pre.th + dTh;
    
    out = [x, y, th];
end

function out = CalcU(u)
    global Tred
    global dt
    
    velo.Tra = u(1);
    velo.Rot = u(2);
    
    Vr = (velo.Rot * Tred + 2 * velo.Tra) / 2;
    Vl = (-velo.Rot * Tred + 2 * velo.Tra) / 2;
    
    dSr = Vr * dt;
    dSl = Vl * dt;
    
    dS = (dSr + dSl) / 2;
    dTh = (dSr - dSl) / Tred;
    
    out = [dS, dTh];
end

function out = CalcRt(param, u)
    out = [param(1) * u(1)^2 + param(2) * u(2)^2, 0;
           0, param(3) * u(1)^2 + param(4) * u(2)^2];
end

function out = CalcAt(pre, u)
    dS = u(1);
    dTh = u(2);
    
    pre_th = pre(3);
    
    out = [1, 0, -dS * sin(pre_th + dTh / 2);
           0, 1, dS * cos(pre_th + dTh / 2);
           0, 0, 1];
end


function out = CalcWt(pre, u)
    dS = u(1);
    dTh = u(2);
    
    pre_th = pre(3);
    
    out = [cos(pre_th + dTh / 2), (-dS / 2) * sin(pre_th + dTh / 2);
           sin(pre_th + dTh / 2), dS / 2 * cos(pre_th + dTh / 2);
           0, 1];
end

function theta = GetIMU(position)   %íné•ãCÇ∆Ç©Ç©ÇÁäpìxÇåvéZÇµÇΩèÍçá
    global Qt
    TrueTheta = position(3);
    
    theta = TrueTheta + (randn() * Qt)
end








