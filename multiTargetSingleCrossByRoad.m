function [tmp] = multiTargetSingleCrossByRoad(startday,endday,W,road,D,CrossIndex2D,timePart)
    index = CrossIndex2D(road)
    [rows,cols] = find(D{index}==startday);
    [rowe,cole] = find(D{index}==endday);
    tmpMa = D{index}(rows:rowe,:);
    nDim = 0;
    if strcmp(timePart,'day')
        nDim = 4;
    elseif strcmp(timePart , 'hour')
        nDim = 3;
    end
    [rown,coln] = find(isnan(tmpMa)==1);
    [rowi,coli] = find(isinf(tmpMa)==1);
    tmpMa([rown',rowi'],:)=[];
    meand = mean(tmpMa(:,2:nDim+1),1);
    
    tmp = 0;
    for j=1:1:nDim
        tmp = tmp + W{index}(j)*meand(j);
    end
end