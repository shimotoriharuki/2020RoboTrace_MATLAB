function out = CalcPosition(position, u)
    pre.x = position(1);
    pre.y = position(2);
    pre.th = position(3);
    
    dS = u(1);
    dTh = u(2);
    
    x = pre.x + dS * cos(pre.th + dTh / 2);
    y = pre.y + dS * sin(pre.th + dTh / 2);
    th = pre.th + dTh;
    
    out = [x, y, th];
end