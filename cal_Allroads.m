%function [res_allroads] = cal_Allroads(allroads)
function  [allComTrafficIndex] = cal_Allroads(D,Distance)
% function  [D] = cal_Allroads(D,res_allroads)
%计算全路网路段
%     n = size(allroads,2);
%     res_allroads = cell(n*2,1);
%     for i=1:n
%         [tmp, a ]= strsplit(allroads{i},'-');
%         %tmp
%         res_allroads{i} = allroads{i};
%         
%         tttttt = (strcat(strcat(tmp(2),'-'),tmp(1)));
%         res_allroads{i+n} = tttttt{1};
%     end

%删除D中非连续路段
% k=0;
% for i=1:14
%     for j=86:-1:1
%         if check(D{i,1}{j,2},res_allroads)==0
%             D{i,1}(j,:) = [];
%         end
%     end
% end


%全区域交通指数
%没有数据为NaN
days = 14;
allComTrafficIndex = cell(days,144,3);
%youxiao_num = zeros(days,144);
for i=1:days
    for j=1:144
        allComTrafficIndex{i,j,1} = D{i,2};
        allComTrafficIndex{i,j,2} = (10000 + floor((j-1)/6)*100 + mod(j-1,6)*10);
        allComTrafficIndex{i,j,3} = 0;
        num = 0;
        i,j
        for k=1:56
            [row_num ,meiyong]= find(D{i,1}{k,1}==allComTrafficIndex{i,j,2});
            if isempty(row_num) %|| D{i,1}{k,1}(row_num,2)==0||D{i,1}{k,1}(row_num,4)==0
                continue;
            end
            len = 0;
            
            if Distance.isKey(D{i,1}{k,2})
                len = Distance(D{i,1}{k,2});
            else
                tmp = strsplit(D{i,1}{k,2},'-');
                a=strcat(strcat(tmp(2),'-'),tmp(1));
                a=a{1};
                len =  Distance(a);
            end
            %youxiao_num(i,j) = youxiao_num(i,j)+1;
            if  D{i,1}{k,1}(row_num,2)==0
                if D{i,1}{k,1}(row_num,4)~=0
                    num = num + (1.0/D{i,1}{k,1}(row_num,4)*len);
                    allComTrafficIndex{i,j,3} = allComTrafficIndex{i,j,3} + D{i,1}{k,1}(row_num,5)*(1.0/D{i,1}{k,1}(row_num,4)*len);
                    continue;
                end
            end
            
            if D{i,1}{k,1}(row_num,2)~=0
                num = num + (D{i,1}{k,1}(row_num,2)/D{i,1}{k,1}(row_num,4)*len);
                allComTrafficIndex{i,j,3} = allComTrafficIndex{i,j,3} + D{i,1}{k,1}(row_num,5)*(D{i,1}{k,1}(row_num,2)/D{i,1}{k,1}(row_num,4)*len);
            end
%             i,k,
            %k,len,Tindex = D{i,1}{k,1}(row_num,5),liuliang = D{i,1}{k,1}(row_num,2),speed = D{i,1}{k,1}(row_num,4),allnum = num,allindex = allComTrafficIndex{i,j,3}
        end
        if num ~= 0
             allComTrafficIndex{i,j,3} = allComTrafficIndex{i,j,3}/num;
        else
            allComTrafficIndex{i,j,3} = NaN;
        end
        %num,allComTrafficIndex{i,j,3}
        
    end
end

% 


end

