%东西南北细化,每个方向三条路，每条路两个方向，三个时间点：早高峰，中午，晚高峰，实验前后对比
function Draw6(D,trafficIndex,CrossIndex2D,trafficIndex10_5, trafficIndex13_24, trafficIndex15_5, trafficIndex17_2, trafficIndex17_6, trafficIndex19_28, trafficIndex24_13, trafficIndex28_19, trafficIndex2_17, trafficIndex5_10, trafficIndex5_15, trafficIndex6_17)
    %早高峰    
    y1=zeros(12,3);
    %中午
    y2=zeros(12,3);
    %晚高峰
    y3=zeros(12,3);
    
    data = {trafficIndex5_15,trafficIndex15_5,trafficIndex24_13,trafficIndex13_24,trafficIndex2_17,trafficIndex17_2,trafficIndex5_10,trafficIndex10_5,trafficIndex17_6,trafficIndex6_17,trafficIndex28_19,trafficIndex19_28}
    s1 = [90508,90512,90517]
    for i=1:1:7
        for j=1:1:12
            if ~isnan(data{j}(find(data{j}==s1(1)),2))
                y1(j,1) = y1(j,1) + data{j}(find(data{j}==s1(1)),2);
                y1(j,3) = y1(j,3)+1;
            end
            if ~isnan(data{j}(find(data{j}==s1(2)),2))
                y2(j,1) = y2(j,1) + data{j}(find(data{j}==s1(2)),2);
                y2(j,3) = y2(j,3)+1;
            end
            if ~isnan(data{j}(find(data{j}==s1(3)),2))
                y3(j,1) = y3(j,1) + data{j}(find(data{j}==s1(3)),2);
                y3(j,3) = y3(j,3)+1;
            end
        end
        s1 = s1 + 100;
    end
    y1(:,1) = y1(:,1)./y1(:,3);
    y2(:,1) = y2(:,1)./y2(:,3);
    y3(:,1) = y3(:,1)./y3(:,3);
    y1(:,3)=0;
    y2(:,3)=0;
    y3(:,3)=0;
    s2 = [922,923,924,925,926,928,929];
    for i=1:1:7
        for j=1:1:12
            if ~isnan(data{j}(find(data{j}==(s2(i)*100+8)),2))
                 y1(j,2) = y1(j,2) + data{j}(find(data{j}==(s2(i)*100+8)),2);
                 y1(j,3) = y1(j,3)+1;
            end
            if ~isnan(data{j}(find(data{j}==(s2(i)*100+12)),2))
                y2(j,2) = y2(j,2) + data{j}(find(data{j}==(s2(i)*100+12)),2);
                y2(j,3) = y2(j,3)+1;
            end
            if ~isnan(data{j}(find(data{j}==(s2(i)*100+17)),2))
                y3(j,2) = y3(j,2) + data{j}(find(data{j}==(s2(i)*100+17)),2);
                y3(j,3) = y3(j,3)+1;
            end
        end
    end
    
    y1(:,2) = y1(:,2)./y1(:,3);
    y2(:,2) = y2(:,2)./y2(:,3);
    y3(:,2) = y3(:,2)./y3(:,3);
    
    %#6-#17单独分析
    roads = {'#6-#7','#7-#8','#8-#17','#17-#8','#8-#7','#7-#6'}
    traIndex = cell(6,1);
    indexTT = zeros(6,3)
    for i=1:1:6
        traIndex{i} = calTrafficIndexByRoads(D,trafficIndex,CrossIndex2D,{roads{i}});
    end
    s1 = 90512;
    for i=1:1:7
        for j=1:1:6
            if ~isnan(traIndex{j}(find(traIndex{j}==s1),2))
                indexTT(j,1) = indexTT(j,1) + traIndex{j}(find(traIndex{j}==s1),2);
                indexTT(j,3) = indexTT(j,3)+1;
            end
        end
        s1 = s1 + 100
    end
    indexTT(:,1) = indexTT(:,1)./indexTT(:,3)
    indexTT(:,3) = 0;
    s2 = [922,923,924,925,926,928,929];
    for i=1:1:7
        for j=1:1:6
            if ~isnan(traIndex{j}(find(traIndex{j}==(s2(i)*100+12)),2))
                 indexTT(j,2) = indexTT(j,2) + traIndex{j}(find(traIndex{j}==(s2(i)*100+8)),2);
                 indexTT(j,3) = indexTT(j,3)+1;
            end
        end
    end
    indexTT(:,2) = indexTT(:,2)./indexTT(:,3)
    indexTT(:,3) = 0;
    figure(1);
    d = 1:1:6;
    bar(indexTT(:,1:2));
    title('#6-#17专项分析-中午');
    set(gca,'xtick',d,'xtickLabel',roads);
    for j=1:1:length(d)
            text(d(j)-0.3,indexTT(j,1)+0.3,num2str(roundn(indexTT(j,1),-2))); 
            text(d(j),indexTT(j,2)+0.3,num2str(roundn(indexTT(j,2),-2)));
     end
    
%     figure(1);
%     d = 1:1:12;
%     XX = {'#5-#15','#15-#5','#27-#13','#13-#27','#2-#17','#17-#2','#5-#10','#10-#5','#17-#6','#6-#17','#28-#19','#19-#28',}
%     bar(y3(:,1:2));
%     title('晚高峰东西南北方向对比');
%     set(gca,'xtick',d,'xtickLabel',XX);
%     for j=1:1:length(d)
%            text(d(j)-0.3,y3(j,1)+0.3,num2str(roundn(y3(j,1),-2))); 
%            text(d(j),y3(j,2)+0.3,num2str(roundn(y3(j,2),-2)));
%     end
%     text((d(3)+d(4))/2,-0.5,'东西方向');
%     text((d(9)+d(10))/2,-0.5,'南北方向');
%     ylim([0 10]);
    
end