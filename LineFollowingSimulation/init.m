global Tvelo;
Tvelo = 2; %[m/s]

global scale;

global L
L = 60 * scale; %[mm]
SensorRadius = 40 * scale;  % [mm]
SensorNumber = 3;   % Number of pieces excluding the center 10以上はdata store memoryを編集する必要あり
SensorAngle = 60;   % One side angle[deg]
AngleBetweenSensor = deg2rad(SensorAngle / SensorNumber); %[rad]
SensorRange = 20 * scale; %[mm]

%Good parameter
%{
global L
L = 0 * scale; %[mm]
SensorRadius = 50 * scale;  % [mm]
SensorNumber = 3;   % Number of pieces excluding the center
SensorAngle = 60;   % One side angle[deg]
AngleBetweenSensor = deg2rad(SensorAngle / SensorNumber); %[rad]
SensorRange = 25 * scale; %[mm]
%}

