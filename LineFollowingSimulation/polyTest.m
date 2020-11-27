L = 10;
W = 2.5;
Origin.X = 10;
Origin.Y = 6;
Angel = 3.14/3;

polyin = polyshape([Origin.X, Origin.X, Origin.X + L, Origin.X + L],[Origin.Y + W, Origin.Y, Origin.Y, Origin.Y + W]);
polyin = rotate(polyin, rad2deg(Angel), [Origin.X, Origin.Y]);
plot(polyin)

axis equal