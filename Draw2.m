%固定路段，横坐标为时间
function Draw2(beforeTestStartDay,beforeTestEndDay,afterTestStartDay,afterTestEndDay,road,D,CrossIndex2D,D2CrossIndex,singleCrossW)    
    [row,col] = size(road);
    index = zeros(col,1);
    for i=1:1:col
        index(i) = CrossIndex2D(road{i});
    end
    beforeTset = zeros(24,3,col);
    afterTest = zeros(24,3,col);
    
%     afterTestStartDay
%     afterTestEndDay
    for i=1:1:col
        for k=1:1:24  
            dayCount = 0;
            for j=afterTestStartDay:100:afterTestEndDay  
                [row,cols] = find(D{index(i)}==j+k-1);
                if size(row) == [1,1]
                    if sum(isnan(D{index(i)}(row,:))) == 0
                        for b = 1:1:3
                            afterTest(k,b,i) =  afterTest(k,b,i)+D{index(i)}(row,b+1);
                        end
                        dayCount = dayCount+1;
                        
                    end
                end
                
            end
            afterTest(k,:,i) = afterTest(k,:,i)/dayCount;
        end
    end
    
    for i=1:1:col 
        for k=1:1:24  
            dayCount = 0;
            for j=beforeTestStartDay:100:beforeTestEndDay  
                [row,cols] = find(D{index(i)}==j+k-1);
                if size(row) == [1,1]
                    if sum(isnan(D{index(i)}(row,:))) == 0
                        for b = 1:1:3
                            beforeTset(k,b,i) =  beforeTset(k,b,i)+D{index(i)}(row,b+1);
                        end
                        dayCount = dayCount+1;
                    end
                end
                
            end
            beforeTset(k,:,i) = beforeTset(k,:,i)/dayCount;
        end
    end
    
    tmpCLT = zeros(24,3,col);
    tmpRS = zeros(24,3,col);
    tmpRAV = zeros(24,3,col);
    tmpUnion = zeros(24,3,col);
    
     for i=1:1:col
         for j=1:1:24
            tmpCLT(j,1) = index(i);
            tmpCLT(j,2,i) = beforeTset(j,1,i);
            tmpCLT(j,3,i) = afterTest(j,1,i);

            tmpRS(j,1,i) = index(i);
            tmpRS(j,2,i) = beforeTset(j,2,i);
            tmpRS(j,3,i) = afterTest(j,2,i);

            tmpRAV(j,1,i) = index(i);
            tmpRAV(j,2,i) = beforeTset(j,3,i);
            tmpRAV(j,3,i) = afterTest(j,3,i);

            tmpUnion(j,1,i) = index(i);
            tmpUnion(j,2,i) = singleCrossW{index(i)}(1)*tmpCLT(j,2,i)+singleCrossW{index(i)}(2)*tmpRS(j,2,i)+singleCrossW{index(i)}(3)*tmpRAV(j,2,i);
            tmpUnion(j,3,i) = singleCrossW{index(i)}(1)*tmpCLT(j,3,i)+singleCrossW{index(i)}(2)*tmpRS(j,3,i)+singleCrossW{index(i)}(3)*tmpRAV(j,3,i);
         end
     end
    
     for i=1:1:col
         figure(i)
         bar(tmpRAV(:,2:3,i));
         d=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24];
         xxx = {'00','01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23'};
         set(gca,'xtick',d,'xtickLabel',xxx);
         title([D2CrossIndex{index(i)} '路段-' '912-914:',num2str(afterTestStartDay/100),'-旅行时间']);
         xlabel('时间');  %x轴
         D2CrossIndex(index(i))
 
         filename = ['C:\Users\admin\Documents\MATLAB\图\按天计算每个时间段的评价\922\旅行时间\',D2CrossIndex{index(i)},'旅行时间.jpg']
        % set(gcf,'paperpositionmode','auto');
         saveas(gcf,filename);
         
     end
     
    
end