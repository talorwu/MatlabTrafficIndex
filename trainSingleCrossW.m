function [W] = trainSingleCrossW(startday , endday, D,timePart)
  
    DforW = cell(42,1);
    [maxrows,maxcols]  = size(D);
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
    
    %计算w
    W = cell(maxrows,1);
    for i=1:1:maxrows
        [x1,PS1]=mapminmax(DforW{i}(:,2));
        [x2,PS2]=mapminmax(DforW{i}(:,3));
        [x3,PS3]=mapminmax(DforW{i}(:,4));
        if nDim == 4
            [x4,PS4]=mapminmax(DforW{i}(:,5));
        end
        if nDim ==4
            X = [x1 x2 x3 x4];
        elseif nDim ==3
            X = [x1 x2 x3]
        end
        [rows,cols] = find(isnan(X)==1);
       [rowe,cole] = find(isinf(X)==1);
       X([rows',rowe'],:)=[];
        H = X'*X;
        [w,lumda]=eig(H); 
         r=abs(sum(lumda)); 
         n=find(r==max(r)); 
        max_lumda=lumda(n,n);
        [rows,cols] =  size(n);
        if cols > 1
            if nDim ==4
                max_x = [0,0,0,0]';
            elseif nDim ==3
                max_x = [0,0,0]'; 
            end
        else
            max_x=w(:,n);
        end
        %[max_x,psw] = mapminmax(max_x);
        W{i} = max_x;
    end
    tmp = zeros(nDim,1);
    count = 0;
     for i=1:1:maxrows
        if W{i} ~= [0 0 0 0]'
            tmp = tmp+W{i};
            count = count+1;
        end
     end
     tmp = tmp/count;
     for i =1:1:maxrows
         if W{i} == [0 0 0 0]'
             W{i} = tmp;
         end
     end
end