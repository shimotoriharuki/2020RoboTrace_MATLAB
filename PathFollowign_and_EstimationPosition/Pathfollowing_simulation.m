%%
%----------------Parameter-----------------%
clear

%Gain
kx = 10;
ky = 25;
kth = 20;


dt = 1;     %[ms]
SimTime = 1000;    %[ms]
Expansion = 1;
PathOffset_y = 1;

omega = 2*pi() * 1e-3;

%%
%----------------Simulation-----------------%
%{
x_ref = linspace(0, 0, SimTime / dt);
y_ref = linspace(0, 0, SimTime / dt);
th_ref = linspace(0, 0, SimTime / dt);
x_err = linspace(0, 0, SimTime / dt);
y_err = linspace(0, 0, SimTime / dt);
th_err = linspace(0, 0, SimTime / dt);
v_tar = linspace(0, 0, SimTime / dt);
omega_tar = linspace(0, 0, SimTime / dt);
dx_cur = linspace(0, 0, SimTime / dt);
dy_cur = linspace(0, 0, SimTime / dt);
dth_cur = linspace(0, 0, SimTime / dt);
x_cur = linspace(0, 0, SimTime / dt);
y_cur = linspace(0, 0, SimTime / dt);
th_cur = linspace(0, 0, SimTime / dt);
v_ref = linspace(0.1, 0.1, SimTime / dt);
omega_ref = linspace(0.01, 0.01, SimTime / dt);
%}
x_ref = 0;
y_ref = 0;
th_ref = 0;
x_err = 0;
y_err = 0;
th_err = 0;
v_tar = 0;
omega_tar = 0;
dx_cur = 0;
dy_cur = 0;
dth_cur = 0;
x_cur = 0;
y_cur = 0;
th_cur = 0;
v_ref = 0;
omega_ref = 0;

t = linspace(0, SimTime, (SimTime / dt));

for Time = 0 : dt : SimTime 
    line = (Time / dt) ;  %行
    
    %----Create reference path(リサージュ曲線)----%
    x_ref = sin(2 * omega * Time) * Expansion;
    y_ref = (-cos(omega * Time ) + PathOffset_y) * Expansion;
    th_ref = atan2(y_ref, x_ref);

    
    %----Clac error----%
    x_err = (x_ref - x_cur) * cos(th_cur) + (y_ref - y_cur) * sin(th_cur);
    y_err = -(x_ref - x_cur) * sin(th_cur) + (y_ref - y_cur) * cos(th_cur);
    th_err = th_ref - th_cur;
    
     %----Clac V & omega----%
    v_tar = v_ref * cos(th_err) + kx * x_err;
    omega_tar = omega_ref + v_ref * (ky * y_err + kth * sin(th_err));
    
    dx_cur = v_tar * cos(th_cur);
    dy_cur = v_tar * sin(th_cur);
    dth_cur = omega_tar;
    
    x_cur = x_cur + dx_cur * dt;
    y_cur = y_cur + dy_cur * dt;
    th_cur = th_cur + dth_cur * dt;
    
    hold on
    scatter(x_cur, y_cur);
end

%%
%----------------Animetion-----------------%
%{
haxes1 = subplot(3,1,1);

haxes2 = subplot(3,1,2);

haxes3 = subplot(3,1,3);



h1 = animatedline(haxes1);
h2 = animatedline(haxes2);
h3 = animatedline(haxes3);

for Time = 1 : dt : SimTime
    AniTime = (Time / dt) ;  
   
    addpoints(h1, x_ref(AniTime), y_ref(AniTime));
    addpoints(h2, t(AniTime), th_ref(AniTime));
    addpoints(h3, x_cur(AniTime), y_cur(AniTime));
  
end
%}
