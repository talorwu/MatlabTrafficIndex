function [D] = importDataSection(dir_path)

        
        %dir_path='D:\贵阳台式机\文档\2017-04-03_2017-04-16\';
        days = 14;%天数
        D = cell(days,2);
        mydir = dir(dir_path);
        
        
        for i=3:length(mydir)
            subdir = dir([dir_path,mydir(i).name]);
            files = dir([dir_path,mydir(i).name,'\',subdir(4).name,'\','*.txt']);
            D_inner = cell(length(files),2);
            
            for j=1:length(files)
                i,j,[mydir(i).name '/' files(j).name]
                %[time vehicles traveltime speed]= textread([dir_path,mydir(i).name,'\',subdir(3).name,'\',files(j).name],'%s %f %f %f','headerlines',1,'NaN', NaN);
                [Date,Time,Direction,Total] = textread([dir_path,mydir(i).name,'\',subdir(4).name,'\',files(j).name],'%s %s %d %d  %*[^\n]','headerlines',1);
                %class(Time)
                timeint = zeros(length(Time),1);
                for k=1:length(Time)
                    
                    Time{k} = Time{k}(1:5);
                    Time{k}(3) = [];
                    timeint(k)= str2num(Time{k})+10000;
                    %class(time{k})
                end
                %size(Time) ,size(Direction),size(Total),size(Left),size(Straight),size(Right)
                %Time
                %class(Time) ,class(Direction)
                %A = [timeint,Direction,Total]
                
                D_inner{j,1}  = sortrows([timeint,Direction,Total],1);
                D_inner{j,2} = files(j).name(1:length(files(j).name)-4);
                
            end
            D{i-2,1} = D_inner;
            D{i-2,2} = mydir(i).name;
        end

       
         
        
end