Tmsig = 0;

for i = 1 : len
    Temp = repmat(msig(1, i), 1, 100);
    Tmsig = [Tmsig Temp];
end

Tmsig(: ,1) = [];


Omega = Omega';

Tomega = 0;
for i = 1 : 5000
    Temp = repmat(Omega(1, i), 1, 4);
    Tomega = [Tomega Temp];
end
Tomega(: ,1) = [];
t = linspace(1, numel(Tmsig), numel(Tmsig))';

Tmsig = Tmsig * PulseWidth;
plot(t,Tmsig, t, Tomega);
