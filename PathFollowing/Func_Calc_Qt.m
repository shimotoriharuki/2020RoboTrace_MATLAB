function [Vt, Wt] = Func_Calc_Qt(Xe, Ye, The, Vr, Wr, Kx, Ky, Kth)
    Vt = Vr * cos(The) + Kx * Xe;
    Wt = Wr + Vr * (Ky * Ye + Kth * sin(The));
end
