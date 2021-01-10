%% イニシャライズ
clear
rosshutdown;
% rosinit("192.168.0.30", 11311);
rosinit("192.168.0.58", 11311);
disp('------------初期化完了---------------');

%% rosrate
desiredRate = 20; %Hz
rate = robotics.Rate(desiredRate);
rate.OverrunAction = 'drop';

t = 0;
reset(rate)
while rate.TotalElapsedTime < 5
    linear = 0.5;
    angular = 0.2 + sin(t);
    
    publishVelocity(linear, angular);
    waitfor(rate);
    
    t = t + 0.2;
    if t >= 2 * pi
        t = 0;
    end
end

% Robot runnning stop
publishVelocity(0.0, 0.0);
