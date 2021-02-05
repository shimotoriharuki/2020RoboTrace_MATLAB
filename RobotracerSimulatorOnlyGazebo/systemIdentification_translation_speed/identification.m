clear;

dataL = importdata("Encorder log/left.txt");
dataR = importdata("Encorder log/right.txt");

%{
plot(dataL);
hold on
plot(dataR);
hold off
%}

% いいかげんなゲイン　float kpL = 3, kiL  = 0, kpR = 3, kiR  = 0;　目標200
dataLI_slack = importdata("Encorder log/left_I_slack.txt");
dataRI_slack = importdata("Encorder log/right_I_slack.txt");
%{
plot(dataLI_slack);
hold on
plot(dataRI_slack);
hold off
%}

% システム同定したゲイン　float kpL = 55.6432, kiL  = 0.96438, kpR = 56.1841, kiR  = 0.51676;　目標200
dataLI = importdata("Encorder log/left_I.txt");
dataRI = importdata("Encorder log/right_I.txt");
%{
plot(dataLI);
hold on
plot(dataRI);
hold off
%}

% システム同定したゲイン　float kpL = 55.6432, kiL  = 0.96438, kpR = 56.1841, kiR  = 0.51676;　目標100
dataLI_100 = importdata("Encorder log/left_I_100.txt");
dataRI_100 = importdata("Encorder log/right_I_100.txt");

plot(dataLI_100);
hold on
plot(dataRI_100);
hold off



legend("left", "right");
