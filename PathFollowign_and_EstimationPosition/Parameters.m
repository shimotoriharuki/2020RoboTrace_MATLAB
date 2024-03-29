Distance = 20;  %この距離でYc/Δyが9.2[%]減少する
SamplingTime = 0.001;    %[s]
Vr = 65;    %[cm/s]

kx = 50;   %Vrが正しければいつか追いつく

ky = 16 / Distance^2;

kt = sqrt(4 * ky);

Omega = 2 * pi() / 10;

fprintf('1/kx : SamplingTime = %f : %f\n', 1 / kx, SamplingTime);
fprintf('1/Vr√ky : SamplingTime = %f : %f\n', 1 / (Vr * sqrt(ky)), SamplingTime);
