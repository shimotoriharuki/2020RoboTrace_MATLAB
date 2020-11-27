dt = 1;     %[s]
SimTime = 100;    %[s]

for Time = 0 : dt : SimTime 
    t_sin = sin(0.1 * Time);
    t_cos = cos(0.1 * Time);
    x_cmd = 0.1 * Time;
    y_cmd = 0.1 * t_sin;
    th_cmd = atan(0.1 * t_cos);
    v_cmd = 0.1 / cos(atan(0.1 * t_cos));
    w_cmd = (-0.01 * t_sin) / (1 + 0.01 * t_cos * t_cos);
    
    hold on
%     scatter(Time, y_cmd);
%     scatter(Time, v_cmd);
    scatter(Time, w_cmd);
end