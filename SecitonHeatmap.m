function [x,heatmap_data_section] = SecitonHeatmap(S,timedecay,directions)
    nums = floor(timedecay/5)
%heatmap  5分钟一个 24*12*7列  
    heatmap_data_section = zeros(24*12*7/nums,73);
    heatmap_data_section(:,:)=NaN;
    x = cell(73,1);
    %创建纵坐标坐标
    i=1;
        for j = 1:size(S{1,1},1)
            lukou = S{1,1}{j,2};
            dirs = directions(lukou);
            for k=1:size(dirs,2)
                x{i} = [lukou '-' num2str(dirs(k))]
                i=i+1;
            end
        end
        
    rows = size(S,1);
    %kk = zeros(73,1)  %当前heatmap_data_section（i,j）第j列元素个数
    for i=8:rows
        rows2 = size(S{i,1},1);
        yi_ = 0
        for j = 1:rows2
            %S{i,1}{j,1}()
            lukou = S{i,1}{j,2};
            dirs = directions(lukou);
            for k = 1:size(S{i,1}{j,1},1)  %遍历元素
                di = -1;
                for ii = 1:size(dirs,2)   %寻找方向下标
                    if S{i,1}{j,1}(k,2) == dirs(ii)
                        di = ii;
                        break;
                    end
                end
                
                time = S{i,1}{j,1}(k,1);
               % d = dirs(di);
                xi = (i-8)*288/nums+floor((time-10000)/100)*12/nums + floor(mod(time,100)/5/nums) + 1;
                yi = yi_ + di;
                value = S{i,1}{j,1}(k,3);
                i,j,k,time,xi,yi,value
                if isnan(heatmap_data_section(xi , yi)) & isnan(value)
                    heatmap_data_section(xi,yi) = NaN;
                elseif isnan(heatmap_data_section(xi,yi))
                    heatmap_data_section(xi,yi)=value;
                elseif ~isnan(value)
                    heatmap_data_section(xi,yi)=heatmap_data_section(xi,yi)+value;
                end
                    
                %heatmap_data_section(xi , yi) =heatmap_data_section(xi,yi) + value;
            end
            yi_ = yi_ + size(dirs,2);
        end
    end

end