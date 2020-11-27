function out = CalcAt(pre, u)
    dS = u(1);
    dTh = u(2);
    
    pre_th = pre(3);
    
    out = [1, 0, -dS * sin(pre_th + dTh / 2);
           0, 1, dS * cos(pre_th + dTh / 2);
           0, 0, 1];
end