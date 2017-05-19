function [directions] = importDirectionForS()
        %统计该路口的方向
    directions = containers.Map();
    directions('#10')= [1 2 3 4];
    directions('#11')= [1 2 4];
    directions('#12')= [1 2 4];
    directions('#13')= [1 2 3 4];
    directions('#15')= [1 3 4];
    directions('#17')= [1 2 4];
    directions('#19')= [1 3 4];
    directions('#2')= [1 2 4];
    directions('#23')= [1 2 3 4];
    directions('#24')= [1 2 3 4];
    directions('#27')= [1 2 4];
    directions('#28')= [2 3 4];
    directions('#31')= [1 2 3];
    directions('#33')= [1 2 4];
    directions('#35')= [2,3,4];  %数据缺失
    directions('#4')= [1 2 3 4];
    directions('#43')= [1 2 3 4];
    directions('#5')= [1 2 3 4];
    directions('#6')= [1 2 3 4];
    directions('#7')= [1 2 3 4];
    directions('#8')= [1 2 3 4];
end