% plot(out.tout, out.SimOut(:,1))
% plot(out.tout, out.SimOut(:,2))
% plot(out.tout, out.SimOut(:,3))

Vr = 200;
plot(out.SimIn(:, 1), out.SimIn(:, 2))
hold on
p = plot(out.SimOut(1), out.SimOut(1),'o','MarkerFaceColor','red');
pr = plot(out.SimIn(1), out.SimIn(1),'o','MarkerFaceColor','blue');
q = quiver(out.SimOut(1), out.SimOut(1), out.Sim_dPc(1, 1), out.Sim_dPc(1, 2) , 100);
q1 = quiver(out.SimIn(1), out.SimIn(1), cos(out.SimIn(1, 1)), sin(out.SimIn(1, 2)) , 100);
hold off

ylim([-40 350])
xlim([-250 250])

a = tic; % start timer
for k = 2 : length(out.tout)
    p.XData = out.SimOut(k, 1);
    p.YData = out.SimOut(k, 2);
    
    pr.XData = out.SimIn(k, 1);
    pr.YData = out.SimIn(k, 2);
    
    b = toc(a); % check timer
    if b > (1/100)
        hold on
        delete(q);
        delete(q1);
        q = quiver(out.SimOut(k, 1), out.SimOut(k, 2), out.Sim_dPc(k, 1), out.Sim_dPc(k, 2) , 1, 'r');  %‘¬“x‚Ì–îˆó
        q1 = quiver(out.SimIn(k, 1), out.SimIn(k, 2), sqrt((out.Sim_dIn(k, 1)^2) + (out.Sim_dIn(k, 2)^2)) * cos(out.SimIn(k, 3)), sqrt((out.Sim_dIn(k, 1)^2) + (out.Sim_dIn(k, 2)^2)) * sin(out.SimIn(k, 3)) , 1, 'g');  %‘¬“x‚Ì–îˆó
        
        drawnow limitrate
        
          
        hold off
        
        a = tic; % reset timer after updating
    end
    
    
    
end