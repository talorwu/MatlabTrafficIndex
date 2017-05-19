function [D] = interpolateSpeed(D)
%     ≤Â÷µÀŸ∂»
[rowD colD] = size(D);
    for i=1:rowD
        tmp1 = D{i,1};
        [rowT clT]= size(tmp1);
        for j=1:rowT
             tmp2 = tmp1{j,1};
             [rowT2,cc] = size(tmp2);
             before = 1;
             for k=2:rowT2-1
                if D{i,1}{j,1}(k,2)==0
                    i,j,k
                    if before ~=0
                       next_nonrezo_line = find_next_nonzero(i,j,k,D); 
                       %D{i,1}{j,1}(k,5) = (D{i,1}{j,1}(k-1,5)+D{i,1}{j,1}(next_nonrezo_line,5))/2;
                       D{i,1}{j,1}(k,4) = (D{i,1}{j,1}(k-1,4)+D{i,1}{j,1}(next_nonrezo_line,4))/2;
                    else
                       %D{i,1}{j,1}(k,5) = D{i,1}{j,1}(k-1,5);
                       D{i,1}{j,1}(k,4) = D{i,1}{j,1}(k-1,4);
                    end
                    before = 0;
                else
                    before = 1;
                end
             end
             
        end
    end
end

function [ii] = find_next_nonzero(i,j,k,D)
    for ii = k+1:size(D{i,1}{j,1},1)
        if D{i,1}{j,1}(ii,2) ~=0
            return;
        end
    end
end