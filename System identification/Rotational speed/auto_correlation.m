function yout = auto_correlation(xin, yin)

    T = length(xin)/2;

    % τを少しずつずらしていく
    for a = 1 : T % a = τ のつもり

        s = 0;

        for t = 2 : T % τを一定値ずらした状態で、2つの波形の積を求める（t = time）

            s = s + yin(t) * yin(t + a); % 右の式を±2/Tの範囲で定積分：x(t)x(t+τ)dt
        end

        yout(a) = s; % x(t)をτの分だけずらした時の積算値を格納
    end

    yout = yout / T;

%     plot(xin(1:length(yout)), yout);
end