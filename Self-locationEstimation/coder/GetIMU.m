function theta = GetIMU(pre, u) %ジャイロから角度を計算した場合
    global Qt
    global dt
    
    theta = pre + (u * dt + randn() * Qt); 
%     theta = pre + (u * dt + normrnd(0, sqrt(Qt))); 
end