function [D,Distance,allComTrafficIndex] = handle_D(dir_path,res_allroads)
    [D,Distance] = importData2(dir_path);
    [D] = interpolateSpeed(D);
    [D] = maxSpeed(D);
    [D] = calTrafficIndex(D);
    [D] = deleteRows(D,res_allroads);
    [allComTrafficIndex] = cal_Allroads(D,Distance)
end

function [D] = deleteRows(D,res_allroads)
for i=1:14
    for j=86:-1:1
        if check(D{i,1}{j,2},res_allroads)==0
            D{i,1}(j,:) = [];
        end
    end
end
end
function [res] = check(s1,s2)
    for i=1:size(s2,1)
        if strcmp(s1 , s2{i})
            res = 1;
            break;
        end
    end
    if i == size(s2,1)
        if strcmp(s1 , s2{size(s2,1)})
            res = 1;
        else
            res = 0;
        end
    end
end