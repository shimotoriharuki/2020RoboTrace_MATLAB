function [path, error] = GetPath(BinaryMap, startLocation, endLocation, numNodes, connectionDistance)
    %----------PRM設定-----------%
%     prm = robotics.PRM(BinaryMap);
    prm = mobileRobotPRM(BinaryMap);
%     prm.Map = BinaryMap;
    prm.NumNodes = numNodes;
    prm.ConnectionDistance = connectionDistance;
    
    %---------パス生成-----------%
    TF = 0;
    counter = 0;
    error = 0;
    while 1
        path = findpath(prm, startLocation, endLocation);
        counter = counter + 1;
        if TF == isempty(path)
            break;
        end
        if counter >= 100
            error = 1;
            break;
        end 
        prm.NumNodes = prm.NumNodes + 100;

    end
end