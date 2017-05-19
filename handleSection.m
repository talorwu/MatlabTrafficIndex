function [S] = handleSection(S,directions)
    S = handleSection1(S,directions)
    S = handleSection2(S,directions)
end
%数据补充,
%  1.如果没有出现的时间段直接补NAN,
%  2.没有出现的方向补NaN
function [S] = handleSection1(S,directions)

    %统计缺失的时间段,补NaN
    start = 10000;
    rows = size(S,1);
    for i=1:rows
        rows2 = size(S{i,1},1);
        
        for j = 1:rows2
            %S{i,1}{j,2} 表示路口  S{i,1}{j,1} 数据
            lukou  = S{i,1}{j,2};
            start = 10000;
            while start <= 12355
                
                fin = find(S{i,1}{j,1}(:,1)==start);
                  
                %i,j,start,size(fin,1)
                if size(fin,1)==0  %没找到对应的时间的,补充NaN
                    
                    rs = size(S{i,1}{j,1},1);
                    dirs = directions(lukou);
                    for k=1:size(dirs,2)
                        S{i,1}{j,1}(rs+k,1) = start;
                        S{i,1}{j,1}(rs+k,2) = dirs(k);
                        S{i,1}{j,1}(rs+k,3) = NaN;
                    end
                end
                start = start + 5;
                if mod(start,100)==60
                    start = start + 40;
                end
            end
            S{i,1}{j,1} = sortrows(S{i,1}{j,1},1);
        end
    end
end

%补充缺失的方向
function [S] = handleSection2(S,directions)
    start = 10000;
    rows = size(S,1);
    for i=1:rows
        rows2 = size(S{i,1},1);
        
        for j = 1:rows2
            %S{i,1}{j,2} 表示路口  S{i,1}{j,1} 数据
            lukou  = S{i,1}{j,2};
            start = 10000;
            while start <= 12355
                
                fin = find(S{i,1}{j,1}(:,1)==start);
                dirs = directions(lukou);
                rs = size(S{i,1}{j,1},1);
                %集合差集
                diff = setdiff(dirs,S{i,1}{j,1}(fin,2));
                if size(diff,2)>0
                    i,j,diff,start,size(diff,2)
                    for k=1:size(diff,2)
                        S{i,1}{j,1}(rs+k,1) = start;
                        S{i,1}{j,1}(rs+k,2) = diff(k);
                        S{i,1}{j,1}(rs+k,3) = NaN;
                    end
                end
                S{i,1}{j,1} = sortrows(S{i,1}{j,1},1);    
                start = start + 5;
                if mod(start,100)==60
                    start = start + 40;
                end
            end
            
        end
    end

end
