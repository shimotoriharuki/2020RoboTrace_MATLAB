clc
clear

tic
% clf
%-----------生データ生成-----------%
%{
SampleNum = 300;
theta = linspace(0, 2 * pi, SampleNum);

funcX = @(th) sin(3 * th);
funcY = @(th) sin(2 * th);
%}
%{
funcX = @(th) 100 * sin(1 * th);
funcY = @(th) 100 * cos(1 * th);
%}
%{
funcX = @(th) 100 * th;
funcY = @(th) 20 * sin(5 * th);
%}
%{
Position = zeros(SampleNum, 2); % [cm]
for i = 1 : SampleNum
    Position(i, 1) = funcX(theta(i));
    Position(i, 2) = funcY(theta(i));
end
%}

% FileName = 'CouseData/2019AllJapan.txt';
% FileName = 'CouseData/2019Student.txt';
% FileName = 'CouseData/2019East.txt';
% FileName = 'CouseData/2019Kansai_points.txt'; %??
% FileName = 'CouseData/2018student_points.txt';
% FileName = 'CouseData/2018alljapan_points.txt';
FileName = 'CouseData/2017alljapan_points.txt';
% FileName = 'CouseData/2016alljapan_points.txt';
% FileName = 'CouseData/2015alljapan_points.txt';

Data = readmatrix(FileName); %[m}

Position = NaN(6000, 2);
for i = 1 : numel(Data(:, 1))
    Position(i, :) = Data(i, :);
end

Position = TrimmingArray(Position);

OneGridScale = 1e2; %[cm]
Position = Position * OneGridScale; 

figure(1)
scatter(Position(:, 1), Position(:, 2));
axis equal

toc
% --------------交差フラグテーブルを生成--------------%
FlagMargin = 0.3 * OneGridScale;
SearchRange = 0.03 * OneGridScale;
Flag = GetCrossFlagTable(Position, FlagMargin, SearchRange);
toc

% --------------ショートカットパスを生成----------------------%
ExpansionLength = 0.1; %拡張する大きさ[m]
ExpansionLength = ExpansionLength * OneGridScale;
NumNodes = 100;
ConnectionDistance = 2;
[ShortcutPath, Error] = GetShortcutPath(Position, Flag, ExpansionLength, OneGridScale, NumNodes, ConnectionDistance);

toc
% --------------plot----------------------%
figure(2)
animatedline(ShortcutPath(:, 1), ShortcutPath(:, 2), 'Color', 'red', 'LineWidth', 1);
axis equal

