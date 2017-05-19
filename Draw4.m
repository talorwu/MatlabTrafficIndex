%固定时间为8:00-9:00,横坐标为日期,连续路段

function Draw4(road,D,CrossIndex2D,W)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [row,col] = size(road);
    index = zeros(col,1);
    for i=1:1:col
        index(i) = CrossIndex2D(road{i});
    end
   targetAM = zeros(col,30);
   targetPM = zeros(col,30);
   for i=1:1:col
       for j=1:1:30
           D{index(i)}(j,2)
           targetAM(i,j) = W{index(i)}(1)*D{index(i)}(j,2)+ W{index(i)}(2)*D{index(i)}(j,3)+ W{index(i)}(3)*D{index(i)}(j,4)+ W{index(i)}(4)*D{index(i)}(j,5);
           targetPM(i,j) = W{index(i)}(1)*D{index(i)}(j,6)+ W{index(i)}(2)*D{index(i)}(j,7)+ W{index(i)}(3)*D{index(i)}(j,8)+ W{index(i)}(4)*D{index(i)}(j,9);
       end
   end
   
   figure(1);
   
   d=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30];
   color = {'r','g','m','b','k','y'}
   for k=1:1:col
     plot(d,targetAM(k,:),color{k});
     hold on;
   end
   plot([18.5,18.5],[0,10],'--k')
     set(gca,'xtick',d,'xtickLabel',D{1}(:,1));
     set(gcf,'paperpositionmode','auto');
     set(gcf,'position',[100,100, 1000, 600]); 
     %title([road,'综合评价指标']);
     %xlabel('日期');  %x轴
     filename = ['C:\Users\admin\Documents\MATLAB\图\综合指标折线图\',road{:},'早高峰综合评价指标.jpg']
     %saveas(gcf,filename);
     A=getframe(gcf);                                     

    imwrite(A.cdata,filename)
    
    figure(2);
    d=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30];
   color = {'r','g','m','b','k','y'}
   for k=1:1:col
     plot(d,targetPM(k,:),color{k});
     hold on;
   end
   plot([18.5,18.5],[0,10],'--k')
     set(gca,'xtick',d,'xtickLabel',D{1}(:,1));
     set(gcf,'paperpositionmode','auto');
     set(gcf,'position',[100,100, 1000, 600]); 
     %title([road,'综合评价指标']);
     %xlabel('日期');  %x轴
     filename = ['C:\Users\admin\Documents\MATLAB\图\综合指标折线图\',road{:},'晚高峰综合评价指标.jpg']
     %saveas(gcf,filename);
     A=getframe(gcf);                                     

    imwrite(A.cdata,filename)
end

