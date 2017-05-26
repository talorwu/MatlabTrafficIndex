function [D] = interpolateSpeed(D)
%     插值速度
[rowD colD] = size(D);
    for i=1:rowD
        tmp1 = D{i,1};
        [rowT clT]= size(tmp1);
        for j=1:rowT
             tmp2 = tmp1{j,1};
             [rowT2,cc] = size(tmp2);
             k=1;
             %标准线性插值，取连续为0的，然后分歩插值
             while k<=rowT2
                if D{i,1}{j,1}(k,2)==0
                    [bef,nex] = find_before_next_nonzero(i,j,k,D);
                    k,bef,nex
                    if bef == nex 
                        if bef == k   %全部是0
                            break
                        else         %只有一个元素不为0
                            for kk = 1:rowT2
                                if kk == bef
                                    continue
                                end
                                D{i,1}{j,1}(kk,4) = D{i,1}{j,1}(bef,4); 
                                D{i,1}{j,1}(kk,2) = -1;
                            end
                            break
                        end
                    end
%                     D{i,1}{j,1}(k,4) = (D{i,1}{j,1}(bef,4)+D{i,1}{j,1}(nex,4))/2;
%                     D{i,1}{j,1}(k,2) = -1
                    D = interpolateHelper(D,i,j,k,rowT2,bef,nex);
                    if nex == 1
                        break
                    end
                    k=nex+1;
                else
                    k = k+1;
                end
             end
             
        end
    end
end

function [bef,nex] = find_before_next_nonzero(i,j,k,D)
     n = size(D{i,1}{j,1},1);
     %i,j,k,n
%     ii = k+1
%     while true
%         ii = mod(ii,n)
%         if D{i,1}{j,1}(ii,2) ~=0
%             return;
%         end
%         ii = ii+1
%     end
    bef = k-1;
    bef = mod(bef,n);
    if bef == 0
            bef = n;
    end
    while D{i,1}{j,1}(bef,2)==0 && bef ~= k
        bef = mod(bef - 1,n);
        if bef == 0
            bef = n;
        end
    end
    nex = k+1;
    nex = mod(nex,n);
    if nex == 0
            nex = n;
    end
    while D{i,1}{j,1}(nex,2)==0 && nex ~= k
        nex = mod(nex + 1,n);
        if nex == 0
            nex = n;
        end
    end
end

%插值帮助函数，线性插值bef-nex之间的值
function D = interpolateHelper(D,i,j,k,rowT2,bef,nex)
    %k,bef,nex
    if k==bef || k == nex
        return 
    end
    %分情况：1.bef > k：此时说明k上面全是0，下面存在不为0的，nex>k一定成立，此时mid = ((bef-144)+nex)/2
    %       2.nex < k ：此时说明k下面全是0，上面存在不为0的，bef<k一定成立，此时mid = ((nex+144)+bef)/2
    %       3.bef < k && nex > k:此时mid = (nex+bef)/2
    if bef > k
        mid = mod(floor((bef - rowT2 + nex)/2),rowT2);
    elseif nex < k
        mid = mod(floor((bef + rowT2 + nex)/2),rowT2);
    else
        mid = mod(floor((bef + nex)/2),rowT2);
    end
    if mid == 0
        mid = rowT2;
    end
    %i,j,k,bef,nex
    
    D{i,1}{j,1}(mid,4) = (D{i,1}{j,1}(bef,4)+D{i,1}{j,1}(nex,4))/2;
    D{i,1}{j,1}(mid,2) = -1;
    k1 = mid-1;
    k2 = mid+1;
    if k1 == 0
        k1 = rowT2;
    end
    if k2 == rowT2+1
        k2 = 1;
    end
    D = interpolateHelper(D,i,j,k1,rowT2,bef,mid);
    D = interpolateHelper(D,i,j,k2,rowT2,mid,nex);
end



