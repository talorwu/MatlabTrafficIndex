function [multiTsingleC] = multiTargetSingleCross(startday,endday,W,D,D2CrossIndex,timePart)
     
    [maxrows,maxcols]  = size(D);
    DforW = cell(maxrows,1);
    multiTsingleC = cell(maxrows,1);
    %取startday和endday之间的数据
    for i=1:1:maxrows
       [rows,cols] = find(D{i}==startday);
       [rowe,cole] = find(D{i}==endday);
       DforW{i} = D{i}(rows:rowe,:);
    end
    nDim = 0;
    if strcmp(timePart,'day')
        nDim = 4;
    elseif strcmp(timePart , 'hour')
        nDim = 3;
    end
    for i=1:1:maxrows
        [rown,coln] = find(isnan(DforW{i})==1);
         [rowi,coli] = find(isinf(DforW{i})==1);
         DforW{i}([rown',rowi'],:)=[];
        
        meand = mean(DforW{i}(:,2:nDim+1),1);
        
        tmp = 0;
        for j=1:1:nDim
            tmp = tmp + W{i}(j)*meand(j);
        end
        multiTsingleC{i} = [startday,endday,tmp];
    end
    
    %写文件
    filename = ['multiTsingleC',num2str(startday),'-',num2str(endday),'.txt'];
    fileexist = 0;
    if exist(filename,'file')
        fileexist=1;
    end
    fid = fopen(filename,'a+');
    if ~fileexist
        fprintf(fid,'road\tstartTime\tendTime\tUnionTarget\r\n');
    end
    for i=1:1:42
        fprintf(fid,'%s\t%d\t%d\t%f\r\n',D2CrossIndex{i},startday,endday,multiTsingleC{i}(3));
    end
end