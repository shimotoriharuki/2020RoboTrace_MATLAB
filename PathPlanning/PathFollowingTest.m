evalin('base', 'ShortcutPath');
evalin('base', 'SaveBineryMap');

robot = differentialDriveKinematics("TrackWidth", 0.12, "VehicleInputs", "VehicleSpeedHeadingRate");

controller = controllerPurePursuit;
controller.Waypoints = ShortcutPath;
controller.DesiredLinearVelocity = 0.8;
controller.MaxAngularVelocity = 100;
controller.LookaheadDistance = 0.6;

robotInitialLocation = ShortcutPath(1,:);
robotGoal = ShortcutPath(end,:);
initialOrientation = 0;

robotCurrentPose = [robotInitialLocation initialOrientation]';

distanceToGoal = norm(robotInitialLocation - robotGoal);
goalRadius = 0.1;


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
    show(SaveBineryMap);
    hold all

    % Plot path each instance so that it stays persistent while robot mesh
    % moves
    plot(ShortcutPath(:,1), ShortcutPath(:,2),"k--d")
    
    % Plot the path of the robot as a set of transforms
    plotTrVec = [robotCurrentPose(1:2); 0];
    plotRot = axang2quat([0 0 1 robotCurrentPose(3)]);
    plotTransforms(plotTrVec', plotRot, 'MeshFilePath', '2WheelRobot.stl', 'Parent', gca, "View","2D", "FrameSize", frameSize);
    light;
%     xlim([0 27])
%     ylim([0 26])
    
    waitfor(vizRate);
end