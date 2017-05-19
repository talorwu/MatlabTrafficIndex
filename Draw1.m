
%固定时间为8:00-9:00,横坐标为路段
function Draw1(beforeTestStartDay,beforeTestEndDay,afterTestStartDay,afterTestEndDay,road,D,CrossIndex2D,D2CrossIndex,singleCrossW)
    [row,col] = size(road);
    index = zeros(col,1);
    for i=1:1:col
        index(i) = CrossIndex2D(road{i});
    end
    beforeTset = zeros(col,3);
    afterTest = zeros(col,3);

    %8:00-9:00
    for i=1:1:col
        dayCount = 0;
        for j=beforeTestStartDay:100:beforeTestEndDay
            [row,cols] = find(D{index(i)}==j+8);
            if size(row) == [1,1]
                %sum(isnan(D{index(i)}(row,:)))
                if sum(isnan(D{index(i)}(row,:))) == 0
                    beforeTset(i,:) =  beforeTset(i,:)+D{index(i)}(row,2:4);
                    dayCount = dayCount+1;
                end
            end
        end
        dayCount
         beforeTset(i,:) = beforeTset(i,:)/dayCount;
    end
%     afterTestStartDay
%     afterTestEndDay
    for i=1:1:col
        dayCount = 0;      
        for j=afterTestStartDay:100:afterTestEndDay
            [row,cols] = find(D{index(i)}==j+8);
            if size(row) == [1,1]
                sum(isnan(D{index(i)}(row,:)))
                if sum(isnan(D{index(i)}(row,:))) == 0
                    afterTest(i,:) =  afterTest(i,:)+D{index(i)}(row,2:4);
                    dayCount = dayCount+1;
                end
            end
        end
        dayCount
        afterTest(i,:) = afterTest(i,:)/dayCount;
    end
    tmpCLT = zeros(col,3);
    tmpRS = zeros(col,3);
    tmpRAV = zeros(col,3);
    tmpUnion = zeros(col,3);
    for i=1:1:col
        tmpCLT(i,1) = index(i);
        tmpCLT(i,2) = beforeTset(i,1);
        tmpCLT(i,3) = afterTest(i,1);
        
        tmpRS(i,1) = index(i);
        tmpRS(i,2) = beforeTset(i,2);
        tmpRS(i,3) = afterTest(i,2);
        
        tmpRAV(i,1) = index(i);
        tmpRAV(i,2) = beforeTset(i,3);
        tmpRAV(i,3) = afterTest(i,3);
        
        tmpUnion(i,1) = index(i);
        tmpUnion(i,2) = singleCrossW{index(i)}(1)*tmpCLT(i,2)+singleCrossW{index(i)}(2)*tmpRS(i,2)+singleCrossW{index(i)}(3)*tmpRAV(i,2);
        tmpUnion(i,3) = singleCrossW{index(i)}(1)*tmpCLT(i,3)+singleCrossW{index(i)}(2)*tmpRS(i,3)+singleCrossW{index(i)}(3)*tmpRAV(i,3);
    end
    tmpCLT
    tmpRS
    tmpRAV
    %画图
    figure(1);
    bar(tmpCLT(:,2:3));
     d=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24];
     set(gca,'xtick',d,'xtickLabel',D2CrossIndex(index)');
     title([num2str(afterTestStartDay/100),'拥堵损失时间评价指标']);
     xlabel('路段');  %x轴
     figure(2);
     bar(tmpRS(:,2:3));
     d=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24];
     set(gca,'xtick',d,'xtickLabel',D2CrossIndex(index)');
     title([num2str(afterTestStartDay/100),'道路饱和度评价指标']);
     xlabel('路段');  %x轴
     figure(3);
      bar(tmpRAV(:,2:3));
     d=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24];
     set(gca,'xtick',d,'xtickLabel',D2CrossIndex(index)');
     title([num2str(afterTestStartDay/100),'旅行时间评价指标']);
     xlabel('路段');  %x轴
     
     figure(4);
      bar(tmpUnion(:,2:3));
     d=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24];
     set(gca,'xtick',d,'xtickLabel',D2CrossIndex(index)');
     title([num2str(afterTestStartDay/100),'综合评价指标']);
     xlabel('路段');  %x轴
     
     
end