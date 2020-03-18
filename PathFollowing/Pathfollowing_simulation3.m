%%
SimTime = 10000; 
dt = 1;

Max_Vt = 1;
Max_Wt = 0.0005;

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

%%
%目標速度
% Vr = (GoalX - StartX) / SimTime;   %[m/s]
Vr = 10;
Wr = 0;      %[rad/s]

Qr = [Vr;
      Wr];
  
%%
%ゲイン
Ky = 6e-3;    %[/mm]
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

plot(Pr(1, :), Pr(2, :));

hold off



h1 = animatedline('Color','r','LineWidth',3);

xlim([0 2000]);
ylim([-0.1 GoalY]);

a = tic; % start timer
for t = 1 : dt : SimTime 
    addpoints(h1, Xc(t), Yc(t));
    
    b = toc(a); % check timer
    if b > (1/1000)
        drawnow % update screen every 1/30 seconds
        a = tic; % reset timer after updating
    end

end

