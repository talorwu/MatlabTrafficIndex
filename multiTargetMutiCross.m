function  [multiTmultiC] = multiTargetMutiCross(startday, endday,W,D,timePart)
    %取startday和endday之间的数据
    singleTmultiC = singleTargetMutiCross(startday,endday,D,timePart);
    nDim = 0;
    if strcmp(timePart , 'day')
        means = mean(singleTmultiC(:,2:5),1);
        nDim = 4;
    elseif strcmp(timePart , 'hour')
        means = mean(singleTmultiC(:,2:4),1);
        nDim = 3;
    end
    multiTmultiC = cell(3,1);
    multiTmultiC{3} = 0;
    multiTmultiC{1} = startday;
    multiTmultiC{2} = endday;
    for i=1:1:nDim
        multiTmultiC{3} = multiTmultiC{3} + W(i)*means(i);
    end
   
     %写入文件
    filename = ['multiTmultiC',num2str(startday),'-',num2str(endday),'.txt'];
    fileexist = 0;
    if exist(filename,'file')
        fileexist=1;
    end
    fid = fopen(filename,'a+');
    if ~fileexist
        fprintf(fid,'startTime\tenddate\tUnionTarget\r\n');
    end
    fprintf(fid,'%d\t%d\t%f\r\n',startday,endday,multiTmultiC{3});
end