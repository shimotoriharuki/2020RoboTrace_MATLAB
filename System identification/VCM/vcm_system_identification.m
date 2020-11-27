clear;

data = importdata("Angle log/Angle.txt");

data = data(1:100, 1);
% data = flip(data);
data = data * -1;
data = data - data(1,1);

plot(data);
%2450~1630