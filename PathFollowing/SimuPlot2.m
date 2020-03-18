% plot(out.tout, out.SimOut(:,1))
% plot(out.tout, out.SimOut(:,2))
% plot(out.tout, out.SimOut(:,3))
%{
plot(out.SimIn(:, 1), out.SimIn(:, 2))
hold on
p = plot(out.SimOut(1), out.SimOut(1),'o','MarkerFaceColor','red');
q = quiver(out.SimOut(1), out.SimOut(1), out.Sim_dPc(1, 1), out.Sim_dPc(1, 2) , 100);
hold off

ylim([-10 400])
xlim([-250 250])
%}
t = out.tout(:, 1);
f = @(t) plot(t, 1, 'r*');
fanimator(f);
playAnimation