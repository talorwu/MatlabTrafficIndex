function [D] = maxSpeed(D)
%该方法返回当天当条路最大的20个速度值的平均值
 [rowD colD] = size(D);
    speed_moren = 40;
    for i=1:rowD
        tmp1 = D{i,1};
        [rowT clT]= size(tmp1);
        for j=1:rowT
            
            %删除NaN元素
             tmp2 = tmp1{j,1}(:,4);
             [m,n] = find(isnan(tmp2)==1);
             tmp2(m) = [];
             speed = sort(tmp2,'descend');  %倒叙
             sizee = size(speed,1)
             if sizee < 20
                 D{i,1}{j,3} = mean(speed);
             else
                D{i,1}{j,3} = mean(speed(1:20));
             end
             if D{i,1}{j,3} == 0 || isnan(D{i,1}{j,3})
                D{i,1}{j,3} = 40
             end
        end
    end
end



function [D] = maxSpeed2(D)
    %date 2017-02-01
    %luduan #5-#4
    
    [rowD colD] = size(D);
    speed_moren = 40;
    for i=1:rowD
        tmp1 = D{i,1};
        [rowT clT]= size(tmp1);
        for j=1:rowT
             tmp2 = tmp1{j,1};
             starttime = 10300;
             endtime = 10650;
             while starttime <= endtime && isempty(find(tmp2==starttime))
                 starttime = starttime + 10
                 if mod(starttime,100) == 60
                    starttime = starttime + 40
                 end
             end
             while starttime <= endtime && isempty(find(tmp2==endtime))
                 endtime = endtime - 10
                 if mod(endtime,100) == 90
                    endtime = endtime - 40
                 end
             end
             i,j,starttime,endtime
             tmp3 = tmp2(find(tmp2==starttime):find(tmp2==endtime),:);
             [row col] = size(tmp3);
             avg_speed = 0;
             car_num = 0;
             if row ~=0
                for k=1:row
                    avg_speed = avg_speed + (tmp3(k,2)+2)*tmp3(k,4);
                    car_num = car_num + tmp3(k,2)+2;
                end
                 if car_num ==0
                    avg_speed = speed_moren;
                 else
                    avg_speed = avg_speed/car_num;
                 end
             else
                 avg_speed = speed_moren;
             end
             i,j 
             D{i,1}{j,3} = avg_speed;
        end
    end
end