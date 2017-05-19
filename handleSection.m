function [S] = handleSection(S,directions)
    S = handleSection1(S,directions)
    S = handleSection2(S,directions)
end
%���ݲ���,
%  1.���û�г��ֵ�ʱ���ֱ�Ӳ�NAN,
%  2.û�г��ֵķ���NaN
function [S] = handleSection1(S,directions)

    %ͳ��ȱʧ��ʱ���,��NaN
    start = 10000;
    rows = size(S,1);
    for i=1:rows
        rows2 = size(S{i,1},1);
        
        for j = 1:rows2
            %S{i,1}{j,2} ��ʾ·��  S{i,1}{j,1} ����
            lukou  = S{i,1}{j,2};
            start = 10000;
            while start <= 12355
                
                fin = find(S{i,1}{j,1}(:,1)==start);
                  
                %i,j,start,size(fin,1)
                if size(fin,1)==0  %û�ҵ���Ӧ��ʱ���,����NaN
                    
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

%����ȱʧ�ķ���
function [S] = handleSection2(S,directions)
    start = 10000;
    rows = size(S,1);
    for i=1:rows
        rows2 = size(S{i,1},1);
        
        for j = 1:rows2
            %S{i,1}{j,2} ��ʾ·��  S{i,1}{j,1} ����
            lukou  = S{i,1}{j,2};
            start = 10000;
            while start <= 12355
                
                fin = find(S{i,1}{j,1}(:,1)==start);
                dirs = directions(lukou);
                rs = size(S{i,1}{j,1},1);
                %���ϲ
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
