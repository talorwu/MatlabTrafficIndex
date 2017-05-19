function [max_x] = trainMultiCrossW(startday , endday , D,timePart)
    [maxrows,maxcols] = size(D);
    DforW = cell(maxrows,1);
    nDim = 0;
    if strcmp(timePart,'day')
        nDim = 4;
    elseif strcmp(timePart , 'hour')
        nDim = 3;
    end
    %取startday和endday之间的数据
    for i=1:1:maxrows
       [rows,cols] = find(D{i}==startday);
       [rowe,cole] = find(D{i}==endday);
       DforW{i} = D{i}(rows:rowe,:);
    end
    %去除异常数据
    apha = 3; % 设置异常数据阈值
    if strcmp(timePart , 'hour')
        apha = 100;
    end
    for i=1:1:maxrows
        [rown,coln] = find(isnan(DforW{i})==1);
         [rowi,coli] = find(isinf(DforW{i})==1);
         DforW{i}([rown',rowi'],:)=[];
        
        meanD = mean(DforW{i}(:,2:nDim+1));
        for j=2:1:nDim+1
            [rowm,colm] = find(DforW{i}(:,j) > apha*meanD(j-1));
            DforW{i}(rowm,:) = [];
        end
    end
    %求每一天的所有路口单个指标均值
    k=1;
    flag = 0;
    multi = 0;
    singleTmultiC = zeros(600,nDim+1);
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
    
    [rows,cols] = find(isnan(singleTmultiC)==1);
       [rowe,cole] = find(isinf(singleTmultiC)==1);
       singleTmultiC([rows',rowe'],:)=[];
    
    %训练W
    X = singleTmultiC(1:k-1,2:nDim+1)
    H = X'*X;
    [w,lumda]=eig(H) 
    r=abs(sum(lumda)); 
    n=find(r==max(r));
    max_lumda=lumda(n,n);
    [rows,cols] =  size(n);
    if cols>1
        if nDim ==4
           max_x = [1,1,1,1]';
        elseif nDim ==3
           max_x = [1,1,1]'; 
        end
    else
        max_x=w(:,n);
    end
    %[max_x,psw] = mapminmax(max_x);
    
end