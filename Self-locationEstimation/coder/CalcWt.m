function out = CalcWt(pre, u)
    dS = u(1);
    dTh = u(2);
    
    pre_th = pre(3);
    
    out = [cos(pre_th + dTh / 2), (-dS / 2) * sin(pre_th + dTh / 2);
           sin(pre_th + dTh / 2), dS / 2 * cos(pre_th + dTh / 2);
           0, 1];
end