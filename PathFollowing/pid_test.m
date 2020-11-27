load('TranslationPlant.mat');
load('RotationPlant.mat');

TranslationPlant = tf1;
RotationPlant = tf2;

Translation_PidController = pid(0.73598, 3.7518, 0);
Rotation_PidController = pid(-218.8515, -4309.9877, 0);

TranslationSys = feedback(Translation_PidController * TranslationPlant, 1);
RotationSys = feedback(Rotation_PidController * RotationPlant, 1);


step(TranslationSys);
step(RotationSys);

y = lsim(TranslationSys, [500, 500], [1, 2]);