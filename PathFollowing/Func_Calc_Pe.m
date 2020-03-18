function [Xe, Ye, The] = Func_Calc_Pe(Xr, Yr, Thr, Xc, Yc, Thc)
    Xe = cos(Thc) * (Xr - Xc) + sin(Thc) * (Yr - Yc);
    Ye = -sin(Thc) * (Xr - Xc) + cos(Thc) * (Yr - Yc);
    The = Thr - Thc;
end