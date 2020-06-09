MapData = evalin('base', 'Pixels');
figure(1)
imshow(MapData)

SE = strel('disk',100, 8);
ExpansionMapData = imdilate(MapData, SE); % Expansion white area

figure(2)
imshow(ExpansionMapData)

ExpansionMapData = imcomplement(ExpansionMapData); %Convert to inverse bit

BinaryMap = binaryOccupancyMap(ExpansionMapData); % Convert to binary map data
figure(3)
show(BinaryMap)

prm = robotics.PRM(BinaryMap);
prm.NumNodes = 500;
prm.ConnectionDistance = 100;

startLocation = [500 250];
endLocation = [500 750];
path = findpath(prm, startLocation, endLocation);

% figure
show(prm);
