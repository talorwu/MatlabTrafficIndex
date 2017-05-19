function [congestionProportion,trafficIndex] = calTrafficIndexByRoads(D,TrafficIndex,CrossIndex2D,roads)
    S = 0;  %总里程数
    [row,col] = size(roads);
    index = zeros(col,1);
    for i=1:1:col
        roads{i}
        CrossIndex2D(roads{i})
        index(i) = CrossIndex2D(roads{i});
        S = S + D{index(i)}(1,6);
    end
    S
    cllls = 168;  %数据行数
    num = zeros(cllls,1);
    num_vkt = zeros(cllls,1);
    trafficIndex = zeros(cllls,2);
    congestionProportion = zeros(cllls,2);
    for i=1:1:col
        for j=1:1:cllls
            if ~isnan(TrafficIndex{index(i)}(j,2))&&~isnan((D{index(i)}(j,3)/D{index(i)}(j,5)*D{index(i)}(j,6)))
                num(j) = num(j) + (D{index(i)}(j,3)/D{index(i)}(j,5)*D{index(i)}(j,6));
                %num_vkt(j) = num_vkt(j)+ (D{index(i)}(j,3)*D{index(i)}(j,6));
                trafficIndex(j,2) =  trafficIndex(j,2) + TrafficIndex{index(i)}(j,2)*((D{index(i)}(j,3)/D{index(i)}(j,5)*D{index(i)}(j,6)));
                if D{index(i)}(j,5) < 30
                    congestionProportion(j,2) = congestionProportion(j,2) + D{index(i)}(j,6) / S*(D{index(i)}(j,3)*D{index(i)}(j,6));
                    num_vkt(j) = num_vkt(j)+ (D{index(i)}(j,3)*D{index(i)}(j,6));
                end
            end
        end
    end
    trafficIndex(:,2) = trafficIndex(:,2) ./  num(:) ;
    congestionProportion(:,2) = congestionProportion(:,2)./num_vkt(:)*100;
    trafficIndex(:,1) =  TrafficIndex{index(i)}(:,1);
    congestionProportion(:,1) = TrafficIndex{index(i)}(:,1);
    
    
end