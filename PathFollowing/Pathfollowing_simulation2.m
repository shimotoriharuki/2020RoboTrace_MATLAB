%%
SimTime = 10000; 
dt = 1;

Max_Vt = 1;
Max_Wt = 0.01;

%%
%目標軌道
StartX = 0;  
GoalX = 2000;

StartY = 0;
GoalY = 100;


StartTh = 0;
GoalTh = 0;

Xr = linspace(StartX, GoalX ,SimTime);
Yr = horzcat(linspace(StartY, StartY, SimTime / 2), linspace(GoalY,  GoalY, SimTime / 2));
Thr = linspace(StartTh, GoalTh ,SimTime);

Pr = [Xr; 
      Yr;
      Thr];

plot(Pr(1, :), Pr(2, :));   

%%
%目標速度
Vr = (GoalX - StartX) / SimTime;   %[m/s]
% Vr = 20;
Wr = 0;      %[rad/s]

Qr = [Vr;
      Wr];
  
%%
%ゲイン
Ky = 6.4e-3;    %[/mm]
Kx = 2;       %[/s]
Kth = 1;      %[/mm]

%%
%初期化
Xe = linspace(0, 0, SimTime);
Ye = linspace(0, 0, SimTime);
The = linspace(0, 0, SimTime);

Xc = linspace(0, 0, SimTime);
Yc = linspace(0, 0, SimTime);
Thc = linspace(0, 0, SimTime);

Vt = linspace(0, 0, SimTime);
Wt = linspace(0, 0, SimTime);

dXc = linspace(0, 0, SimTime);
dYc = linspace(0, 0, SimTime);
dThc = linspace(0, 0, SimTime);

%% 
%シミュレーション

for t = 1 : dt : SimTime 
    [Xe(1, t), Ye(1, t), The(1, t)] = Func_Calc_Pe(Xr(1, t), Yr(1, t), Thr(1, t), Xc(1, t), Yc(1, t), Thc(1, t));   %Pe計算(位置エラー)
    
    [Vt(1, t), Wt(1, t)] = Func_Calc_Qt(Xe(1, t), Ye(1, t), The(1, t), Vr, Wr, Kx, Ky, Kth);  %Qt計算(速度ターゲット)
    
    if Vt(1, t) >= Max_Vt 
    Vt(1, t) = Max_Vt;
    elseif Vt(1, t) <= -Max_Vt 
        Vt(1, t) = -Max_Vt;
    end
    
    if Wt(1, t) >= Max_Wt
        Wt(1, t) = Max_Wt;
    elseif Wt(1, t) <= -Max_Wt
        Wt(1, t) = -Max_Wt;
    end
    
    [dXc(1, t), dYc(1, t), dThc(1, t)] = Func_Calc_dPc(Vt(1, t), Wt(1, t), Thc(1, t));    %dPc計算(現在の機体の速度)

    Xc(1, t + 1) = Xc(1, t) + dXc(1, t) * dt;
    Yc(1, t + 1) = Yc(1, t) + dYc(1, t) * dt;
    Thc(1, t + 1) = Thc(1, t) + dThc(1, t) * dt;
    
end

hold on
plot(Xc, Yc);
hold off








