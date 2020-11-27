% --------------main-----------------%
% Initialize
hold off

time = 0;
ContinueTime = 30;  %[s]
global dt;
dt = 0.1;   %[s]

Step = ceil((ContinueTime - time)/dt);

velo.T = 1;  %[m/s]
velo.R = 0.1;    %[rad/s]]
u = [velo.T, velo.R];

global Qsigma; 
Qsigma = [0.2, 0.2]; %[Transration Rotation]


true.x = 0; %[m]
true.y = 0; %[m]
true.th = 0;    %[rad]
TruePosition = [true.x, true.y, true.th]';   %[x, y, th]

Odo.x = 0;
Odo.y = 0;
Odo.th = 0;
OdoPosition = [Odo.x, Odo.y, Odo.th];   %[x, y, th]

% Simuration
for i = 1 : Step
    time = time + dt;
    
    % Updata true position
    TruePosition = CalcTruePosition(TruePosition, u);
    
    % Updata odometory position (add noise)
    OdoPosition = CalcOdometoryPosition(OdoPosition, u);
    
    % Animation
    if rem(i, 5)==0
        plot(TruePosition(:, 1), TruePosition(:, 2),'.blue'); hold on;
        plot(OdoPosition(:, 1), OdoPosition(:, 2),'.black'); hold on;
        axis equal;
        
    
        drawnow
    end
end



% --------------Functions-----------------%
function position = CalcTruePosition(position, u)
    global dt
    
    th = position(3) + u(2) * dt;
    x = position(1) + u(1) * cos(position(3)) * dt;
    y = position(2) + u(1) * sin(position(3)) * dt;
   
    position = [x, y, th];
end

function  position = CalcOdometoryPosition(position, u)
    global dt
    global Qsigma;
    
    u(1) = u(1) + randn() * Qsigma(1);
    u(2) = u(2) + randn() * Qsigma(2);
    
    th = position(3) + u(2) * dt;
    x = position(1) + u(1) * cos(position(3)) * dt;
    y = position(2) + u(1) * sin(position(3)) * dt;
   
    position = [x, y, th];
end







