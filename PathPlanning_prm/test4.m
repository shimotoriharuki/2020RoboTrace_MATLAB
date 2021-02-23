clear
robot = differentialDriveKinematics("TrackWidth", 1, "VehicleInputs", "VehicleSpeedHeadingRate");

load exampleMaps
map = binaryOccupancyMap(simpleMap);
figure(1)
show(map)


mapInflated = copy(map);
inflate(mapInflated, 1);
figure(2)
show(mapInflated)

prm = robotics.PRM(mapInflated);
prm.NumNodes = 100;
prm.ConnectionDistance = 10;



startLocation = [4.0 2.0];
endLocation = [24.0 20.0];

TF = 0;
counter = 0;
while 1
    path = findpath(prm, startLocation, endLocation);
    prm.NumNodes = prm.NumNodes + 10;
    counter = counter + 1;
    
    if TF == isempty(path) || counter > 100
        break;
    end
end

% figure
show(prm);



controller = controllerPurePursuit;
controller.Waypoints = path;
controller.DesiredLinearVelocity = 2;
controller.MaxAngularVelocity = 5;
controller.LookaheadDistance = 0.5;

robotInitialLocation = path(1,:);
robotGoal = path(end,:);
initialOrientation = 0;

robotCurrentPose = [robotInitialLocation initialOrientation]';

distanceToGoal = norm(robotInitialLocation - robotGoal);
goalRadius = 0.5;


% Initialize the simulation loop
sampleTime = 0.1;
vizRate = rateControl(1/sampleTime);

% Determine vehicle frame size to most closely represent vehicle with plotTransforms
frameSize = robot.TrackWidth/0.8;



while( distanceToGoal > goalRadius )
    
    % Compute the controller outputs, i.e., the inputs to the robot
    [v, omega] = controller(robotCurrentPose);
    
    % Get the robot's velocity using controller inputs
    vel = derivative(robot, robotCurrentPose, [v omega]);
    
    % Update the current pose
    robotCurrentPose = robotCurrentPose + vel*sampleTime; 
    
    % Re-compute the distance to the goal
    distanceToGoal = norm(robotCurrentPose(1:2) - robotGoal(:));
    
    % Update the plot
    hold off
    show(map);
    hold all

    % Plot path each instance so that it stays persistent while robot mesh
    % moves
    plot(path(:,1), path(:,2),"k--d")
    
    % Plot the path of the robot as a set of transforms
    plotTrVec = [robotCurrentPose(1:2); 0];
    plotRot = axang2quat([0 0 1 robotCurrentPose(3)]);
    plotTransforms(plotTrVec', plotRot, 'MeshFilePath', '2WheelRobot.stl', 'Parent', gca, "View","2D", "FrameSize", frameSize);
    light;
    xlim([0 27])
    ylim([0 26])
    
    waitfor(vizRate);
end
