function  out = CalcPositionWithError(position, u)
    global sigma;
    
    u(1) = u(1) + randn() * sqrt(sigma(1));
    u(2) = u(2) + randn() * sqrt(sigma(2));
    
    out = CalcPosition(position, u);   

end