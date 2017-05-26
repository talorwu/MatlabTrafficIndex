function [D,Distance,allComTrafficIndex] = handle_D(dir_path,res_allroads)
% function [D,allComTrafficIndex] = handle_D(D,res_allroads,Distance)
    [D,Distance] = importData2(dir_path);
    
     [D] = interpolateSpeed(D);
    [D] = completeD(D)
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

%补全D
function [D] = completeD(D)
    start = 10000;
    rows = size(D,1);
    for i=1:rows
        rows2 = size(D{i,1},1);
        
        for j = 1:rows2
            %S{i,1}{j,2} 表示路口  S{i,1}{j,1} 数据
            lukou  = D{i,1}{j,2};
            start = 10000;
            while start <= 12355
                
                fin = find(D{i,1}{j,1}(:,1)==start);
                  
                %i,j,start,size(fin,1)
                if size(fin,1)==0  %没找到对应的时间的,全部补位NaN
                    
                    rs = size(D{i,1}{j,1},1);
                    D{i,1}{j,1}(rs+1,1) = start;
                    for k=2:4   
                        D{i,1}{j,1}(rs+1,k) = NaN;
                    end
                end
                start = start + 10;
                if mod(start,100)==60
                    start = start + 40;
                end
            end
            D{i,1}{j,1} = sortrows(D{i,1}{j,1},1);
        end
    end
end