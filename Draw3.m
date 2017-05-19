%分析一天的拥堵时段
%开始时间mddhhmm
function Draw3(day,road,Dminute5,CrossIndex2D,D2CrossIndex)
    DforW = cell(42,1);
    [row,col] = size(road);
    index = zeros(col,1);
    for i=1:1:col
        index(i) = CrossIndex2D(road{i});
    end
    [maxrows,maxcols]  = size(Dminute5);
    %取startday和endday之间的数据
    for i=1:1:maxrows
       [rows,cols] = find(Dminute5{i}==day);
       [rowe,cole] = find(Dminute5{i}==day+2355);
       DforW{i} = Dminute5{i}(rows:rowe,:);
    end
    timeX = cell(col,1);
    yongdu = cell(col,1);
    minspeed = 36;
    for i=1:1:col
        [rows,cols] = size(DforW{index(i)});
        yongdu{i} = zeros(rows,1);
        for j=1:1:rows
            timeX{i}{j} = num2str(mod(DforW{index(i)}(j,1),10000),'%04d');
            %按照旅行时间
            k = DforW{index(i)}(j,3)/DforW{index(i)}(j,5);
            if k<=1.3
                yongdu{i}(j) = 0;
            elseif k<=1.5
                yongdu{i}(j) = 1;
            elseif k<=1.8
                yongdu{i}(j) = 2;
            elseif k<=2
                yongdu{i}(j) = 3;
            elseif k>2
                yongdu{i}(j) = 4;
            end
        end
    end
    d=1:1:288;
    for i=1:1:1
        index(i)
        figure(13*(i-1)+1);
        plot(d,DforW{index(i)}(:,2),'-b',d,DforW{index(i)}(:,4),'-r');
        set(gca,'xtick',d,'xtickLabel',timeX{i});
        title([D2CrossIndex{index(i)},'路段-',num2str(int16(day/10000)),'流量和速度变化图-r速度-b流量'])
        
        
        %画拥堵指示
        for j=0:2:23
            d2=1:0.01:24;
            l=1;
            for k=1:0.01:24;
                yongdu2(l) = yongdu{i}(j*12+floor(d2(l)));
                l=l+1;
            end
            d3=1:1:24;
             figure(13*(i-1)+1+(j/2)+1);
             plot(d2,yongdu2,'*r');
             set(gca,'xtick',d3,'xtickLabel',timeX{i}(j*12+1:j*12+24));
            title([D2CrossIndex{index(i)},'路段-',num2str(int16(day/10000)),'-',num2str(j,'%2d'),'-',num2str(j+2,'%2d'),'拥堵指示']);
        end
    end
end