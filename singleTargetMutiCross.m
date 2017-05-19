function  [singleTmultiC] = singleTargetMutiCross(startday,endday,D,timePart)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    %开始时间和结束时间以2016-01-01的时间差
    
%    %画柱状图
%     bar(D{1}(startday:endday,4)) 
%     set(gca,'XTickLabel',D{1}(startday:endday,1))
%     

%     %去除异常数据
%     apha = 3; % 设置异常数据阈值
%     for i=1:1:42
%         meanD = mean(DforW{i}(:,2:5));
%         for j=2:1:5
%             [rowm,colm] = find(DforW{i}(:,j) > apha*meanD(1,j));
%             DforW{i}(rowm,:) = [];
%         end
%     end
    %计算多个路口单个指标
    nDim = 0;
    if strcmp(timePart,'day')
        nDim = 4;
    elseif strcmp(timePart , 'hour')
        nDim = 3;
    end
    
    k=1;
    flag = 0;
    multi = 0;
    singleTmultiC = zeros(500,nDim+1);
    maxrows = size(D);
    for i=startday:1:endday
        multi = 0;
        flag = 0;
        for j=1:1:maxrows
            [row,col] = find(D{j}==i);
            if size(row)==1
                flag = 1;
                if ~any(isnan(D{j}(row,:))) && ~any(isinf(D{j}(row,:)))
                    singleTmultiC(k,2:nDim+1) = singleTmultiC(k,2:nDim+1) + D{j}(row,2:nDim+1);
                    multi = multi+1;
                end
            end
        end
        singleTmultiC(k,2:nDim+1) = singleTmultiC(k,2:nDim+1)./multi;
        singleTmultiC(k,1) = i;
        %multi
        if flag == 1
            k = k +1 ;
        end
    end
    
    [rown,coln] = find(isnan(singleTmultiC)==1);
    [rowi,coli] = find(isinf(singleTmultiC)==1);
    singleTmultiC([rown',rowi'],:)=[];
    singleTmultiC(k:500,:)=[];
    %写入文件
    filename = ['singleTmuliC',num2str(startday),'-',num2str(endday),'.txt'];
    fileexist = 0;
    if exist(filename,'file')
        fileexist=1;
    end
    fid = fopen(filename,'a+');
    if ~fileexist
        if nDim == 4
            fprintf(fid,'date\tCLT\tPHTT\tRS\tRAV\r\n');
        elseif nDim ==3
            fprintf(fid,'date\tCLT\tRS\tRAV\r\n');
        end
        
    end
    for i=1:1:k-1
        if nDim == 4
            fprintf(fid,'%d\t%f\t%f\t%f\t%f\r\n',singleTmultiC(i,1),singleTmultiC(i,2),singleTmultiC(i,3),singleTmultiC(i,4),singleTmultiC(i,5));
        elseif nDim ==3
            fprintf(fid,'%d\t%f\t%f\t%f\r\n',singleTmultiC(i,1),singleTmultiC(i,2),singleTmultiC(i,3),singleTmultiC(i,4));
        end
    end

end

