function [dXc, dYc, dThc] = Func_Calc_dPc(Vt, Wt, Thc)
    dXc = Vt * cos(Thc);
    dYc = Vt * sin(Thc);
    dThc = Wt;
end