% 同定後のデータプロット

Omega2PI = importdata("Identification Log/Omega2PI.txt");
Omega15 = importdata("Identification Log/Omega15.txt");
Omega152010 = importdata("Identification Log/Omega152010.txt");
Omega152010_H = importdata("Identification Log/Omega152010_H.txt");


plot(Omega2PI);
plot(Omega15);
plot(Omega152010);
plot(Omega152010_H);
xlabel('t[ms]')
ylabel('AngularVelocity[rad/s]')

xlim([0 3000])

