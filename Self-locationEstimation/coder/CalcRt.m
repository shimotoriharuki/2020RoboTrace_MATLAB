function out = CalcRt(param, u)
    out = [param(1) * u(1)^2 + param(2) * u(2)^2, 0;
           0, param(3) * u(1)^2 + param(4) * u(2)^2];
end