%% 前処理
clc
clf
clear

% --------------コースデータ用意-----------------%
course_x = round(-100 : 1 : 500); %cm
course_y = round(sin(course_x/100) * 100); %cm
% course = [[0, 1, 2, 3, 4, 5]; [0, 0, 1, 1, 2, 2]];

figure(1)
scatter(course_x, course_y)
title('コース元データ')
xlabel('x')
ylabel('y')

% ------------------正の整数にするためにマージンをとる---------------- %
min_x = min(course_x);
min_y = min(course_y);
if min_x < 0
    mergin_x = linspace(abs(min_x), abs(min_x), length(course_x));
    course_x = course_x + mergin_x;
end
if min_y < 0
    mergin_y = linspace(abs(min_y), abs(min_y), length(course_y));
    course_y = course_y + mergin_y;
end

course = [course_x; course_y];

figure(2)
scatter(course(1, :), course(2, :))
title('マージンしたコースデータ')
xlabel('x')
ylabel('y')

% -------------------マップ作成--------------------%
expantion = round(10); %cm 膨張させる大きさ
map = Map(course, expantion);

figure(3)
heatmap(map.binary_grid)
title('バイナリマップ')
xlabel('x')
ylabel('y')

%% 計算
% -----------A star開始------------ %

map.grid(map.start(1) + 1, map.start(2) + 1).h_cost = getHcost(map.start, map.goal);




function cost = getHcost(node_pos, goal_pos)
    cost = goal_pos(1) - node_pos(1) + goal_pos(2) - node_pos(2);
end


















