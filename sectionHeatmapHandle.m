%处理白天夜晚不同的时间间隔，例如白天5分钟，晚上30分钟


function  [heatmap] = sectionHeatmapHandle(heatmap_data,dayinterval,nightinterval,nightstart,nightend)
    daynums = floor(dayinterval/5);
    nightnums = floor(nightinterval/5);
    nightStartRow = floor((nightstart-10000)/100)*12 + floor(mod(nightstart,100)/5) + 1;
    nightEndRow = floor((nightend-10000)/100)*12 + floor(mod(nightend,100)/5);
    heatmap = zeros(size(heatmap_data,1),size(heatmap_data,2));
    for i=1:size(heatmap_data,2)
        for j=1:size(heatmap_data,1)
            dayth = floor(j/288);
            s = dayth*288 + nightStartRow;
            e = dayth*288+nightEndRow;
            %j
            if s <= j & j <= e
                %startRow = floor((j-dayth*288-nightStartRow)/nightnums)*nightnums + dayth*288 + nightStartRow;
                %endRow = startRow+nightnums-1;
                
                %j,i,startRow,endRow,dayth*288 + nightStartRow,dayth*288+nightEndRow
                %if(check(startRow,endRow,i,heatmap_data))
                if check2(j,i,nightnums,heatmap_data)>=nightnums
                    heatmap(j,i) = heatmap_data(j,i);
                elseif isnan(heatmap_data(j,i))
                    heatmap(j,i) = 0;
                else
                    heatmap(j,i) = heatmap_data(j,i);
                end
            else
                heatmap(j,i) = heatmap_data(j,i);
            end
            
        end
    end
end

%返回ture代表有连续nightnums个NaN
function [res] = check(startRow,endRow,col,heatmap_data)
    res = true;
    for ii=startRow:endRow
        if ~isnan(heatmap_data(ii,col))
            res = false;
            return 
        end
    end
end

function [res] = check2(row,col,nightnums,heatmap_data)
    rowUp = row;
    while rowUp>=1 & row-rowUp<nightnums & isnan(heatmap_data(rowUp,col))
        rowUp = rowUp-1;
    end
    rowDown = row;
    while rowDown <=2016 & rowDown-row<nightnums & isnan(heatmap_data(rowDown,col))
        rowDown = rowDown+1;
    end
    res =  rowDown-rowUp-1;
end