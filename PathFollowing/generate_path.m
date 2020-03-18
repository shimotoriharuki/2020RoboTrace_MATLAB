% clear

dt = 0.001;
t = 0 : dt : 10;
omega = 2 * pi() / 10;
Theta = omega * t;
Expansion = 100;
x = numel(t);
%円
%{
Px = -Expansion * sin(Theta);
Py = -Expansion * cos(Theta) + 100;
%}

%リマソン

Py = -Expansion * ((1 + 2 * cos(Theta)) .* cos(Theta)) + 300;
Px = Expansion * ((1 + 2 * cos(Theta)) .* sin(Theta));


%sin
%{
Px = Expansion * t;
Py = Expansion * sin(Theta);
%}

%L字
%{
Ax = linspace(0, x, x/2);
Bx = linspace(x, x, (x/2)+1);
Px = horzcat(Ax, Bx) / 100;
Ay = linspace(0, 0, x/2);
By = linspace(0, x, (x/2)+1);
Py = horzcat(Ay, By) / 100;
%}


shiftPx = circshift(Px ,1);
shiftPy = circshift(Py ,1);
shiftPx(1, 1) = 0;
shiftPy(1, 1) = 0;


%{
tempPth = atan2(Py - shiftPy, Px - shiftPx);  
shiftPth = circshift(tempPth ,1);
shiftPth(1, 1) = 0;
%}

%{
diffPth = tempPth - shiftPth;
shift_diffPth = circshift(diffPth ,1);
shift_diffPth(1, 1) = 0;
%}


Pth = linspace(0, 0, x);
diffPth = linspace(0, 0, x);
x = numel(t);
temp = 0;
preX = 0;
preY = 0;
prePth = 0;

for i = 1 : x
    tempPth = atan2(Py(1, i) - preY, Px(1, i) - preX);  
    
    if (tempPth < -pi()/2) && (prePth > pi()/2)
        diffPth(1, i) = (tempPth + 2*pi()) - prePth;

    elseif (tempPth > pi()/2) && (prePth < -pi()/2)
        diffPth(1, i) = (tempPth - 2*pi()) - prePth;

    else
        diffPth(1, i) = tempPth - prePth;
    end
    
    temp = temp + diffPth(1, i);
    
    Pth(1, i) = temp;
%     Pth(1, i) = diffPth(1, i);
    
    preY = Py(1, i);
    preX = Px(1, i);
    prePth = tempPth;
  
end

%{
for i = 1 : x
    if (tempPth(1, i) < 0) && (shiftPth(1, i) > 0)
        diffPth(1, i) = tempPth(1, i) + shiftPth(1, i);
        disp('if')
        
    elseif (tempPth(1, i) > 0) && (shiftPth(1, i) < 0)
        diffPth(1, i) = -tempPth(1, i) - shiftPth(1, i); 
        disp('elseif')
        
    else
        diffPth(1, i) = tempPth(1, i) - shiftPth(1, i);
        disp('else')
        
    end
    temp = temp + diffPth(1, i);
    
    Pth(1, i) = temp;
  
end
%}

Rvel = diff(Pth);

%プロット
haxes1 = subplot(2, 1, 1);
plot(Px, Py);
% ylim([0 400])

haxes2 = subplot(2, 1, 2);
% ylim([1e-3 2e-3])
% plot(t, Pth, 'b');

plot(diffPth);


h1 = animatedline(haxes1, 'Color','r','LineWidth',3);
h2 = animatedline(haxes2, 'Color','r','LineWidth',3);
a = tic; % start timer

for sim = 1 : 10000 
    addpoints(h1, Px(sim), Py(sim));
    addpoints(h2, sim, Pth(sim));
    
    b = toc(a); % check timer
    if b > (1/1000)
        drawnow % update screen every 1/30 seconds
        a = tic; % reset timer after updating
    end
end



% To simulink
Px = Px';
Py = Py';
Pth = Pth';
t = t';

simuinPx = [t, Px];
simuinPy = [t, Py];
simuinPth = [t, Pth];

