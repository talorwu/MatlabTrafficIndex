function [D] = calTrafficIndex(D)
    
    [rowD colD] = size(D);
    %rowD = 14;

    

    for i=1:rowD
        tmp1 = D{i,1};
        [rowT clT]= size(tmp1);
        for j=1:rowT
             tmp2 = tmp1{j,1};
             [rowT2,cc] = size(tmp2);
             for k=1:rowT2
                if isnan(tmp2(k,4))
                    res = NaN;
                else
                    res = cal(tmp1{j,3},tmp2(k,4));
                end
                D{i,1}{j,1}(k,5) = res;
             end
             
        end
    end
    

end

function [res] = cal(C,v)
    if v >= C || v <= 0
        res = 0;
    else
        afa = 10.0 / (log(1.2*C) - log(0.2*C));
        S = -afa * log(0.2*C);
        res = afa*log(1.2*C-v)+S;
    end
    if res < 0
        res = 0;
    end
end
