% 同定後のデータプロット

speed50015001000 = importdata("Translation Log/speed50015001000.txt");



plot(speed50015001000);

xlabel('t[ms]')
ylabel('Velocity[m/s]')

xlim([0 3000])

