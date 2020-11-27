Distance = 20;  %‚±‚Ì‹——£‚ÅYc/ƒ¢y‚ª9.2[%]Œ¸­‚·‚é
SamplingTime = 0.001;    %[s]
Vr = 65;    %[cm/s]

kx = 50;   %Vr‚ª³‚µ‚¯‚ê‚Î‚¢‚Â‚©’Ç‚¢‚Â‚­

ky = 16 / Distance^2;

kt = sqrt(4 * ky);

Omega = 2 * pi() / 10;

fprintf('1/kx : SamplingTime = %f : %f\n', 1 / kx, SamplingTime);
fprintf('1/Vrãky : SamplingTime = %f : %f\n', 1 / (Vr * sqrt(ky)), SamplingTime);
