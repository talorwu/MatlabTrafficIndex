function [D,Distance] = importData2(dir_path)
    %import distance
    Distance = containers.Map();
        Distance('#5-#4')= 0.64;
		Distance('#4-#10')= 1.20;
		Distance('#10-#6')= 1.40;
		Distance('#6-#7')= 0.71;
		Distance('#7-#8')= 0.60;
		Distance('#8-#17')= 1.90;
		Distance('#2-#17')= 0.88;	
		Distance('#13-#11')= 0.74;	
		Distance('#11-#8')= 0.52;	
		Distance('#12-#8')= 1.40;
		Distance('#5-#17')= 6.5;
		Distance('#5-#10')= 1.84;
		Distance('#10-#8')= 2.71;		
		Distance('#6-#17')= 3.21;	
		Distance('#6-#8')= 1.31;	
		Distance('#5-#31')= 1.9;	
		Distance('#31-#15')= 0.92;	
		Distance('#31-#33')= 1.1;
		Distance('#4-#33')= 1.4;
		Distance('#15-#10')= 4.4;
		Distance('#15-#23')= 2.5;
		Distance('#15-#19')= 2.8;
		Distance('#15-#33')= 2.2;
		Distance('#23-#19')= 1.1;
		Distance('#23-#10')= 2.2;
		Distance('#19-#10')= 2.9;
		Distance('#19-#24')= 0.8;
		Distance('#24-#27')= 0.4;
		Distance('#24-#28')= 0.88;
		Distance('#12-#24')= 1.2;
		Distance('#6-#12')= 1.3;
		Distance('#43-#12')= 0.82;
		Distance('#8-#43')= 0.55;
		Distance('#35-#8')= 0.62;
		Distance('#35-#2')= 1.3;
		Distance('#35-#17')= 1.3;
		Distance('#5-#15')= 2.82;
		Distance('#13-#27')= 4.2;
		Distance('#8-#5')= 4.6;	
		Distance('#19-#28')= 1.6;
		Distance('#24-#13')= 3.8;
		Distance('#12-#13')= 2.6;
		Distance('#43-#13')= 1.8;
        
        
        %dir_path='D:\贵阳台式机\文档\2017-04-03_2017-04-16\';
        days = 14;%天数
        D = cell(days,2);
        mydir = dir(dir_path);
        
        
        for i=3:length(mydir)
            subdir = dir([dir_path,mydir(i).name]);
            files = dir([dir_path,mydir(i).name,'\',subdir(3).name,'\','*.txt']);
            D_inner = cell(length(files),2);
            
            for j=1:length(files)
                
                %[time vehicles traveltime speed]= textread([dir_path,mydir(i).name,'\',subdir(3).name,'\',files(j).name],'%s %f %f %f','headerlines',1,'NaN', NaN);
                [time vehicles] = textread([dir_path,mydir(i).name,'\',subdir(3).name,'\',files(j).name],'%*s %s %f %*[^\n]','headerlines',1);
                traveltime = zeros(length(vehicles),1);
                speed = zeros(length(vehicles),1);
                timeint = zeros(length(vehicles),1);
                for k=1:length(vehicles)
                    if vehicles(k) == 0 
                        traveltime(k) = 0;
                        speed(k) = 0;
                    else
                        [a b c d e] = textread([dir_path,mydir(i).name,'\',subdir(3).name,'\',files(j).name],'%s %s %f %f %f',1,'headerlines',k);
                        traveltime(k) = d;
                        speed(k) = e;
                    end
                    
                    time{k} = time{k}(1:5);
                    time{k}(3) = [];
                    timeint(k) = str2num(time{k})+10000;
                    %class(time{k})
                end
                D_inner{j,1}  = sortrows([timeint vehicles traveltime speed],1);
                D_inner{j,2} = files(j).name(1:length(files(j).name)-4);
                [mydir(i).name '/' files(j).name]
            end
            D{i-2,1} = D_inner;
            D{i-2,2} = mydir(i).name;
        end

       
         
        
end