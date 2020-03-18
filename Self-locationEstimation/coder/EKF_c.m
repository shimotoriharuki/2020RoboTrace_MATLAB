% --------------main-----------------%
% Initialize
function [] = EKF_c()

    global dt;
    dt = 0.1;   %[s]
    StartTime = 0;
    ContinueTime = 30;  %[s]
    Step = ceil((ContinueTime - StartTime)/dt);

    % Machine parameter Init
    global Tred ;
    Tred = 100e-3;  %[m]
    % WheelR = 10e-3; %[m] 

    % Input parameter Init
    Robot_u = [1, 0.1]; %[Transration, Rotation]
    input = [0, 0]; %[dS, dTh]

    % error parameter Init
    global sigma; 
    sigma = [0, 0]; %[Transration, Rotation]
    global Rt  %input error
    Rt = [0, 0;
          0, 0];
    global a;
    global fake_a;
    a = [0.1, 0.1, 0.1, 0.1]; %[a1, a2, a3, a4]
    fake_a = [0.05, 0.05, 0.05, 0.05]; %[a1, a2, a3, a4]
    global Qt %observe error
    global fake_Qt %fake observe error
    Qt = 0.001 ^2; %観測ノイズ共分散
    fake_Qt = 0.005 ^2;


    % Position init
    TruePosition = [0, 0, 0];   %[x, y, th]
    OdoPosition = [0, 0, 0];   %[x, y, th]
    PreXt = [0, 0, 0];
    EstXt = [0, 0, 0];
    PreZt = 0;

    % Dispersion init
    ExtPt = [0, 0, 0;
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
    %     Rt = CalcRt(a, input);  %プロセスノイズ共分散
        Rt = CalcRt(fake_a, input);  %プロセスノイズ共分散
        sigma = [Rt(1, 1), Rt(2, 2)];

        % Updata true position
        TruePosition = CalcTruePosition(TruePosition, input);   

        % Updata odometory position (add noise)
        OdoPosition = CalcPositionWithError(OdoPosition, input);

        % Forecast step
        EstXt = CalcPositionWithError(PreXt, input);
        
        At = CalcAt(PreXt, input);
        Wt = CalcWt(PreXt, input);

        EstPt = At * PrePt * At' + Wt * Rt * Wt';

        % Update step
        ObsZt = GetIMU(PreZt, Robot_u(1, 2));
        Ht = [0, 0, 1];
    %     St = Ht * EstPt * Ht' + Qt;
        St = Ht * EstPt * Ht' + fake_Qt;
        Kt = St \ (EstPt * Ht');
        EstXt = EstXt';
        EstXt = EstXt + Kt * (ObsZt - Ht * EstXt);
        EstPt = (eye - Kt * Ht) * EstPt;
        EstXt = EstXt';

    %     xlim([-5, 15]);
    %     ylim([0 25]);
        % Animation
        if rem(i, 10)==0
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
        PrePt = ExtPt;
        PreZt = ObsZt;
    end
end