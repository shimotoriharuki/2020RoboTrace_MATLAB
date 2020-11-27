rad = 0;
increment = 0.01;

hold off
for i = 1 : 500
    rad = rad + increment;
    
    if rem(i, 10) == 0
        plot(i, sin(rad), '.b'); 
        plot(i, cos(rad), '.r'); 
        drawnow;
        hold on;    
    end
end


