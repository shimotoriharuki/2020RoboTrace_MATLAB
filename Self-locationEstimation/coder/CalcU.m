function out = CalcU(u) 

    global Tred
    global dt
    
    velo.Tra = u(1);
    velo.Rot = u(2);
    
    Vr = (velo.Rot * Tred + 2 * velo.Tra) / 2;
    Vl = (-velo.Rot * Tred + 2 * velo.Tra) / 2;
    
    dSr = Vr * dt;
    dSl = Vl * dt;
    
    dS = (dSr + dSl) / 2;
    dTh = (dSr - dSl) / Tred;
    
    out = [dS, dTh];
end