function Position = GetTruePosition(PrePosition, velo)
    u = CalcU(velo);
    Position = CalcPosition(PrePosition, u);
end