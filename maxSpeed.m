function [D] = maxSpeed(D)
    %date 2017-02-01
    %luduan #5-#4
    starttime = 10300;
    endtime = 10650;
    [rowD colD] = size(D);
    speed_moren = 40;
    for i=1:rowD
        tmp1 = D{i,1};
        [rowT clT]= size(tmp1);
        for j=1:rowT
             tmp2 = tmp1{j,1};
             tmp3 = tmp2(find(tmp2==starttime):find(tmp2==endtime),:);
             [row col] = size(tmp3);
             avg_speed = 0;
             car_num = 0;
             if row ~=0
                for k=1:row
                    avg_speed = avg_speed + (tmp3(k,2)+1)*tmp3(k,4);
                    car_num = car_num + tmp3(k,2)+1;
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
             D{i,1}{j,3} = avg_speed
        end
    end
end