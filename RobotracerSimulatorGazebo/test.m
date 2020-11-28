rosshutdown;
rosinit("192.168.0.30", 11311);

rostopic list
rostopic info /robotracer/odom

laser = rossubscriber('/robotracer/odom');
pause(2)

scandata = receive(laser,10);

figure
plot(scandata,'MaximumRange',7)

