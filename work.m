
% function work(allComTrafficIndex,heatmap_data,nums,place_name,D,pie_colorbar,pathDir)
% function  [AM_rush,PM_rush,MeanRush,rush_most,mean_index,mean_rush_most,max_rush_most,nums,heatmap_data]=work(allComTrafficIndex,D,pathDir)
% function  work(allComTrafficIndex,D,pathDir)
function [AM_rush,PM_rush,MeanRush] = work(allComTrafficIndex)

%第一步
[AM_rush,PM_rush,MeanRush] = calcAMPMRush(allComTrafficIndex);
% AMPMVariationDiagram(allComTrafficIndex,0,1,pathDir);
% AMPMVariationDiagram(allComTrafficIndex,1,2,pathDir);
% [rush_most,mean_index,mean_rush_most,max_rush_most] = mostCongestion(allComTrafficIndex,0,3,pathDir);
% mostCongestion(allComTrafficIndex,1,4,pathDir);
% heatmap_data = calcHeatmapData(D);
% nums = calcNums(heatmap_data);
% exportHeatmap(heatmap_data,D,pathDir)

% % % 第二步
%  drawHeatmap(heatmap_data,place_name,D,1,1,pathDir)
% drawHeatmap(heatmap_data,place_name,D,0,2,pathDir)

% %第三部步
% filePath = [pathDir 'heatmap_交通指数_灰底.png']
% savePath = [pathDir 'heatmap_交通指数_tm.png']
% heatmap_handle(filePath,savePath);

%第四步
% drawHeatmapForPiece(heatmap_data,D,place_name,pathDir)

% % %第五步
% createPie(nums,1,1,pathDir);
% createPie(nums,0,1,pathDir);

% %第六步
% pieFilePath = [pathDir '饼图_灰底.png']
% savePath = [pathDir '饼图_透明.png']
% pie_handle(pieFilePath,savePath)

end

function exportHeatmap(heatmap_data,D,pathDir)
%导出heatmap
heatmap_data_header = cell(337,57);
for i=2:57
    for j=2:337
        heatmap_data_header{j,i} = heatmap_data(j-1,i-1);
    end
end
for i=2:57
    %res_allroads{i-1}
    heatmap_data_header{1,i} = D{1,1}{i-1,2};
end
for j=2:337
    heatmap_data_header{j,1} = 5080000 + floor((j-2)/48)*10000 + floor((mod(j-2,48))/2) * 100 + (mod(j,2)*30);
end

fp = fopen([pathDir 'heatmap_data_header.txt'],'wt');
fprintf(fp,'\t');
for i=2:57
    i,
    fprintf(fp,'%s\t' ,heatmap_data_header{1,i});
end

for i=2:337
    for j=1:57
        if j==1
            fprintf(fp,'%d\t',heatmap_data_header{i,j});
        else
            fprintf(fp,'%.3f\t',heatmap_data_header{i,j});
        end
    end
end
xlswrite([pathDir 'heatmap_data.xls'],heatmap_data_header(:,:));
end

function drawHeatmapForPiece(heatmap_data,D,place_name,pathDir)
    load mycolor
    y = cell(56,1);
for i=1:56
    y{i} = num2name(D{1,1}{i,2},place_name);
end
    for i=1:1:56
        heatmap_data(:,i)
        y{i}
        tmp = heatmap_data(:,i);
        %heatmap第一个不能为NaN
        if isnan(tmp(1))
            tmp(1)=0
        end
        h = heatmap(tmp',[],[],[],'TickAngle', 90, 'Colormap',mycolor,'NaNColor',[0 0 0],'ShowAllTicks',1,'MinColorValue',0,'MaxColorValue',10,'TickFontSize',10);
        set(gcf,'PaperUnits','inches','PaperPosition',[0 0 1920 130],'Position',[100 100 1920 130]);
        set(gca,'Position',[0 0 1 1])
        myFileName=[pathDir 'heatmap_分片_1\' y{i} '.png'];
        box off
        print('-djpeg',myFileName,'-r1')

        %saveas(h,['D:\贵阳台式机\MATLAB\20170410_0423\heatmap',num2str(i),'.jpg'])
    end
end

function drawHeatmap(heatmap_data,place_name,D,flag,fig,pathDir)
figure(fig);
%class(gcf)

% s=datenum('01-16 00:00:00');
% e=datenum('01-22 23:30:00');
% d=1/48;
% xx=datestr((s:d:e)','mm-dd HH:MM:ss')

y = cell(56,1);
for i=1:56
    y{i} = num2name(D{1,1}{i,2},place_name);
end
load mycolor
%灰色缺失值
if flag == 0
[h,h1,h2] = heatmap(heatmap_data',[],y,[],'TickAngle', 90, 'Colormap',mycolor,'Colorbar', {'Ytick',[0:10],'YtickLabel',[0:10],'Location','NorthOutside'},'NaNColor',[0.6 1 0.6],'ShowAllTicks',1,'MinColorValue',0,'MaxColorValue',10,'TickFontSize',6);
else
 [h,h1,h2] = heatmap(heatmap_data',[],y,[],'TickAngle', 90, 'Colormap',mycolor,'Colorbar', {'Ytick',[0:10],'YtickLabel',[0:10],'Location','NorthOutside'},'NaNColor',[0 0 0],'ShowAllTicks',1,'MinColorValue',0,'MaxColorValue',10,'TickFontSize',7);
end
%     l = get(f,'ColorBar')
%     %l=mycolor;
% %     b = 0:2:10
%     set(l,'xtick',[0:2:10],'xticklabel',b); 
label ='  星期一                          星期二                          星期三                          星期四                          星期五                          星期六                          星期日'
xlabel(label,'FontSize',16)
% ylabel('交通指数','FontSize',18)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 1920 1080],'position',[0,0,1920,1080]);
set(gca,'Position',[0.17 0.08 0.8 0.8])
box off
%白底

%灰色底
if flag==0
set(gca,'color',[204/255,204/255,204/255]);  %灰色背景


%set(gca,'ycolor','w');
%set(gca,'xcolor','w');
% leg = legend({'本周最堵一天（周五）','本周平均'},'Position',[0.2 0.90 0.1 0.1]);
% set(leg,'Box','off','TextColor',[1,1,1]);
myFileName = [pathDir 'heatmap_交通指数_hs','.png'];
A=getframe(gcf);
A = A.cdata;
% imwrite(A,myFileName);
%A = imread(myFileName);

%调整背景透明
%alpha = zeros(449,943);
%Alpha = getAlpha(A);

%imwrite(A,'output2.png','Alpha',Alpha);
% imwrite(A,myFileName,'Alpha',Alpha) %存储调整过大小的图片
% imwrite(A,myFileName) %存储调整过大小的图片
end

end
%调整heatmapdata,去掉一些NaN比较多的行和比较多的列
function [y_,heatmap_data_] = adjustHeatmap_data(y,heatmap_data)
    heatmap_data_ = zeros(24*2*7,56-8);
    qudiao = [7,15,20,36,37,38,53,54]
    %cols = [
    j = 1
    for i = 1:56
        if ~any(qudiao == i)
            heatmap_data_(:,j) = heatmap_data(:,i);
            y_(j) = y(i)
            j = j + 1;
        end
    end
    %周三00:00-06:00  NaN变成0
    for i= 1:48
        for j = 48*2+1:48*2+12
            if isnan(heatmap_data_(j,i))
                heatmap_data_(j,i) = 0;
            end
        end
    end
end
function heatmap_data = calcHeatmapData(D)
%heatmap
heatmap_data = zeros(24*2*7,56);
num = zeros(24*2*7,56);
for i=8:14
    for j=1:144
        for k=1:56

            [row_num ,meiyong]= find(D{i,1}{k,1}==(10000 + floor((j-1)/6)*100 + mod(j-1,6)*10));
            if isempty(row_num)
                continue;
            else
                if D{i,1}{k,1}(row_num,5) <0
                  i,j,k
                 end
                num((i-8)*48+floor((j-1)/3)+1,k) = num((i-8)*48+floor((j-1)/3)+1,k) +1;
                heatmap_data((i-8)*48+floor((j-1)/3)+1,k) = heatmap_data((i-8)*48+floor((j-1)/3)+1,k) + D{i,1}{k,1}(row_num,5);
            end
        end
    end
end
for i=1:size(num,1)
    for j=1:size(num,2)
        if num(i,j)==0
            %i,j
            heatmap_data(i,j) = NaN;
        end;
    end
end

heatmap_data = heatmap_data./num;
end

function nums = calcNums(heatmap_data)
%各个拥堵等级比例
nums = zeros(6);
for i=1:size(heatmap_data,1)
    for j=1:size(heatmap_data,2)
        if isnan(heatmap_data(i,j))
            nums(6)= nums(6)+1;
            continue;
        end
        if heatmap_data(i,j) == 10
            nums(5) = nums(5) +1;
        else
            nums(floor(heatmap_data(i,j)/2)+1) = nums(floor(heatmap_data(i,j)/2)+1) + 1;
        end
    end
end
ssum = sum(nums);
nums = (nums/ssum)*100;
end

function [rush_most,mean_index,mean_rush_most,max_rush_most] = mostCongestion(allComTrafficIndex,flag,fig,pathDir)
%=最毒一天分析   //本周周五最堵
rush_most = zeros(48,2);
mean_index = zeros(48,1);
for i=1:144
    if ~isnan(allComTrafficIndex{12,i,3})
        rush_most(floor((i-1)/3)+1,1) = rush_most(floor((i-1)/3)+1,1)+ allComTrafficIndex{12,i,3};
        rush_most(floor((i-1)/3)+1,2) = rush_most(floor((i-1)/3)+1,2)+1;
    end
    tmp = 0;
    tmpcount = 0;
    for k=8:14
        if ~isnan(allComTrafficIndex{k,i,3})
            tmp = tmp + allComTrafficIndex{k,i,3};
            tmpcount = tmpcount+1;
        end
    end
    mean_index(floor((i-1)/3)+1) = mean_index(floor((i-1)/3)+1) + tmp/tmpcount;
end
rush_most(:,1) = rush_most(:,1)./rush_most(:,2);
mean_index = mean_index./3;
max_rush_most = 1;
mean_rush_most = 0;
for i=1:size(rush_most(:,1))
    if rush_most(i,1) > rush_most(max_rush_most,1)
        max_rush_most = i;
    end
end
mean_rush_most = (mean(rush_most(16:19,1))+mean(rush_most(36:38,1)))/2;

figure(fig)
N0=datenum([0 0 0 0 0 0]);  %起始时间 10：15
dN=datenum([0 0 0 0 30 0]);    %时间增量，1分钟
x=N0+(0:48-1)*dN;
x(48) = datenum([0 0 0 23 59 59])
% x = 1:48;
% dd = {'00:00','00:30','01:00','01:30','02:00','02:30','03:00','03:30','04:00','04:30','05:00','05:30','06:00','06:30','07:00','07:30','08:00','08:30','09:00','09:30','10:00','10:30','11:00','11:30','12:00','12:30','13:00','13:30','14:00','14:30','15:00','15:30','16:00','16:30','17:00','17:30','18:00','18:30','19:00','19:30','20:00','20:30','21:00','21:30','22:00','22:30','23:00','23:30'};
%set(gca,'xlim',[1 48],'xtick',x,'xtickLabel',dd');
plot(x,rush_most(:,1),'o-','color',[188/255,95/255,211/255],'LineWidth',3)
hold on
plot(x,mean_index,'^-','color',[0,169/255,135/255],'LineWidth',3)
datetick(gca,'x','HH:MM');
% Add title and axis labels
%title('本周最堵一天雨周平均比较（交通指数）');
xlabel('时间','FontSize',20)
ylabel('交通指数','FontSize',20)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 943 449],'position',[200,200,943,449]);
leg = legend({'本周最堵一天（周五）','本周平均'},'Position',[0.2 0.88 0.1 0.1]);
set(gca,'FontSize',18,'Position',[0.07 0.12 0.9 0.9]);
set(leg,'Box','off');
box off
%白底
if flag==1
myFileName = [pathDir '本周最堵一天（周五）与周平均比较（交通指数）_白底','.png'];
A=getframe(gcf);
A = A.cdata;
imwrite(A,myFileName);
else
%透明
set(gca,'color',[204/255,204/255,204/255]);
set(gca,'ycolor','w');
set(gca,'xcolor','w');
set(leg,'TextColor',[1,1,1]);
myFileName = [pathDir '本周最堵一天（周五）与周平均比较（交通指数）','.png'];
A=getframe(gcf);
A = A.cdata;
%A = imread(myFileName);
%alpha = zeros(449,943);
Alpha = getAlpha(A);

%imwrite(A,'output2.png','Alpha',Alpha);
imwrite(A,myFileName,'Alpha',Alpha) %存储调整过大小的图片
end
%柱状图
% 
% ys = zeros(48,2);
% ys(:,1) = rush_most(:,1)
% ys(:,2) = mean_index(:,1)
%  d=1:48
% figure(2)
%  bar(x,ys);
% set(gca,'xtickLabel',x);
% datetick(gca,'x','HH:MM');
% xlabel('时间')
% grid on
% ylabel('交通指数')
% 
% for j=1:1:length(d)
%     text(d(j)-0.2,ys(j,1)+0.2,num2str(roundn(ys(j,1),-2)));
%     text(d(j)+0.1,ys(j,2)+0.2,num2str(roundn(ys(j,2),-2)));
% end

end
function AMPMVariationDiagram(allComTrafficIndex,flag,fig,pathDir)
%本周早晚高峰变化
%flag == 1:白底
%flag == 0:透明
AM_rush_day = zeros(7,2);
PM_rush_day = zeros(7,2);
for i=8:14
    for j=46:57  %早高峰
        if ~isnan(allComTrafficIndex{i,j,3})
            AM_rush_day(i-7,1) = AM_rush_day(i-7,1) + allComTrafficIndex{i,j,3};
            AM_rush_day(i-7,2) = AM_rush_day(i-7,2)+1;

        end
    end
    for j=103:114  %晚高峰
        if ~isnan(allComTrafficIndex{i,j,3})
            PM_rush_day(i-7,1) = PM_rush_day(i-7,1) + allComTrafficIndex{i,j,3};
            PM_rush_day(i-7,2) = PM_rush_day(i-7,2)+1;
        end
    end
end
AM_rush_day(:,1) = AM_rush_day(:,1)./AM_rush_day(:,2);
PM_rush_day(:,1) = PM_rush_day(:,1)./PM_rush_day(:,2);
x = 1:7;
dd = {'星期一','星期二','星期三','星期四','星期五','星期六','星期日'};
% figure(1)
% semilogy(x, AM_rush_day(:,1), 'bo-')
% hold on
% semilogy(x, PM_rush_day(:,1), 'r^-')
%
% %Turn on the grid
% % grid on
% set(gca,'xtick',x,'xtickLabel',dd);
% plot(x,AM_rush_day(:,1),'bo-',x,PM_rush_day(:,1),'r^-')
% % Add title and axis labels
% %title('本周早晚高峰指数变化');
% xlabel('日期（星期）')
% ylabel('高峰交通指数')
% grid on
% %柱状图
ys = zeros(7,2);
ys(:,1) = AM_rush_day(:,1);
ys(:,2) = PM_rush_day(:,1);

figure(fig);

b=bar(ys,0.9);

ch = get(b,'children');
set(ch{1},'facecolor',[1/255,148/255,225/255])
set(ch{2},'facecolor',[129/255,134/255,151/255])
leg = legend([ch{1} ch{2}],{'早高峰','晚高峰'},'Position',[0.88 0.88 0.1 0.1]);

d=1:7;
if flag==0
for j=1:1:length(d)
    text(d(j)-0.30,ys(j,1)+0.2,num2str(roundn(ys(j,1),-1)),'color',[1,1,1],'fontsize',16);
    text(d(j)+0.05,ys(j,2)+0.2,num2str(roundn(ys(j,2),-1)),'color',[1,1,1],'fontsize',16);
end
else
    for j=1:1:length(d)
    text(d(j)-0.30,ys(j,1)+0.2,num2str(roundn(ys(j,1),-1)),'fontsize',16);
    text(d(j)+0.05,ys(j,2)+0.2,num2str(roundn(ys(j,2),-1)),'fontsize',16);
end
end
xlabel('日期（星期）','FontSize',20);
ylabel('交通指数','FontSize',20);
%xlabel('\fontsize{18}');ylabel('\fontsize{18}');
%set(gcf,'color','none');
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 943 449],'position',[200,200,943,449]);
set(gca,'xtick',x,'xtickLabel',dd,'FontSize',18,'Position',[0.07 0.12 0.8 0.8]);
set(leg,'Box','off');
box off
%白底
if flag==1
myFileName = [pathDir '本周早晚高峰变化（交通指数）_白底','.png'];
A=getframe(gcf);
A = A.cdata;
imwrite(A,myFileName);
else
%透明
set(gca,'color',[204/255,204/255,204/255]);
set(leg,'TextColor',[1,1,1]);


set(get(b(1),'BaseLine'),'Color','w')
set(get(b(2),'BaseLine'),'Color','w')

set(gca,'ycolor','w');
set(gca,'xcolor','w');
%axes1 = axes('Parent',fig11,'Position',[0.05 0.52 0.43 0.43]);
myFileName = [pathDir '本周早晚高峰变化（交通指数）' '.png'];
A=getframe(gcf);
A = A.cdata;
%A = imread(myFileName);
%alpha = zeros(449,943);
Alpha = getAlpha(A);

%imwrite(A,'output2.png','Alpha',Alpha);
imwrite(A,myFileName,'Alpha',Alpha) %存储调整过大小的图片
end
end

function [AM_rush,PM_rush,MeanRush] = calcAMPMRush(allComTrafficIndex)
%早高峰7:30-9:30   晚高峰17:00-19:00
    AM_rush = zeros(3,2); %45-56
    PM_rush = zeros(3,2);%102-113
    MeanRush = zeros(3,1);


%     tmpDataAM1 = allComTrafficIndex{1:5,45:56,3};
%     tmpDataPM1 = allComTrafficIndex{1:5,102:113,3};
%     tmpDataAM2 = allComTrafficIndex{8:12,45:56,3};
%     tmpDataPM2 = allComTrafficIndex{8:12,102:113,3};
%上周数据
    for i=2:5
        for j=46:57  %早高峰
            if ~isnan(allComTrafficIndex{i,j,3})
                AM_rush(1,1) = AM_rush(1,1) + allComTrafficIndex{i,j,3};
                AM_rush(1,2) = AM_rush(1,2)+1
            end
        end
        for j=103:114  %晚高峰
            if ~isnan(allComTrafficIndex{i,j,3})
                PM_rush(1,1) = PM_rush(1) + allComTrafficIndex{i,j,3};
                PM_rush(1,2) = PM_rush(1,2)+1
            end
        end
    end
    %本周数据
    for i=8:12
        for j=46:57  %早高峰
            if ~isnan(allComTrafficIndex{i,j,3})
                AM_rush(2,1) = AM_rush(2,1) + allComTrafficIndex{i,j,3};
                AM_rush(2,2) = AM_rush(2,2)+1
            end
        end
        for j=103:114  %晚高峰
            if ~isnan(allComTrafficIndex{i,j,3})
                PM_rush(2,1) = PM_rush(2,1) + allComTrafficIndex{i,j,3}
                PM_rush(2,2) = PM_rush(2,2)+1

            end
        end
    end
    AM_rush(1,1) = AM_rush(1,1)./AM_rush(1,2);
    PM_rush(1,1) = PM_rush(1,1)./PM_rush(1,2);
    AM_rush(2,1) = AM_rush(2,1)./AM_rush(2,2);
    PM_rush(2,1) = PM_rush(2,1)./PM_rush(2,2);
    AM_rush(3,1) = (AM_rush(2,1)-AM_rush(1,1))/AM_rush(1,1)*100;
    PM_rush(3,1) = (PM_rush(2,1)-PM_rush(1,1))/PM_rush(1,1)*100;
    MeanRush(1) = (AM_rush(1,1)+ PM_rush(1,1))/2;
    MeanRush(2) = (AM_rush(2,1)+ PM_rush(2,1))/2;
    MeanRush(3) = (MeanRush(2)-MeanRush(1))/MeanRush(1)*100;
end

function heatmap_handle(filePath,savePath)
A = imread(filePath);
[dim1,dim2,dim3]=size(A);
Alpha=ones(dim1,dim2);
%背景透明
for i=1:dim1
    for j=1:dim2
        %i,j,A(i,j,:)
        if (A(i,j,1)==204 &A(i,j,2)==204 & A(i,j,3)==204)
            
            Alpha(i,j) = 0;
        end
    end
end
%字变白色
for i=1:dim1
    for j=1:dim2
        %i,j,A(i,j,:)
        if (A(i,j,1)<255 &A(i,j,2)<255 & A(i,j,3)<255)
            
            A(i,j,1) = 255;
            A(i,j,2) = 255;
            A(i,j,3) = 255;
        end
    end
end
%缺失值变黑色
for i=1:dim1
    for j=1:dim2
        %i,j,A(i,j,:)
        if (A(i,j,1)==0.6*255 &A(i,j,2)==255& A(i,j,3)==0.6*255)
            
            A(i,j,1)=0;
            A(i,j,2)=0;
            A(i,j,3)=0;
        end
    end
end
imwrite(A,savePath,'Alpha',Alpha); %存储调整过大小的图片

end
function [Alpha] =getAlpha(A)
[dim1,dim2,dim3]=size(A);
Alpha=ones(dim1,dim2);
for i=1:dim1
    for j=1:dim2
        %i,j,A(i,j,:)
        if (A(i,j,1)==204 &A(i,j,2)==204 & A(i,j,3)==204)%||(A(i,j,1)==0 &A(i,j,2)==0 & A(i,j,3)==0)
            
            Alpha(i,j) = 0;
        end
    end
end
end
function [res] = num2name(num,place_name)
[num1,meiyong] = strsplit(num,'-');
[num11,meiyong] = strsplit(num1{1},'#');
[num12,meiyong] = strsplit(num1{2},'#');
real_num1 = str2num(num11{2});
real_num2 = str2num(num12{2});
name1 = place_name(real_num1);
name1 = name1{1};
name2 = place_name(real_num2);
name2 = name2{1};
res = [name1 '———' name2];

end
function pie_handle(pieFilePath,savePath)
A= imread(pieFilePath);
Alpha = getAlpha(A);
A = A_handle(A);

%imwrite(A,'output2.png','Alpha',Alpha);
imwrite(A,savePath,'Alpha',Alpha); %存储调整过大小的图片
end
function createPie(nums,flag,fig,pathDir)
figure
explode = [0 0 0 1 1 1];
labs = cell(6,1)
for i = 1:size(labs,1)
    labs{i} = [num2str(roundn(nums(i),-2)) '%'];
end
pie(nums,explode,labs);
if flag == 0
colormap([0.2,1,0 
    0.6,1,0 
    1,1,0 
    1,0.6,0 
    1,0.2,0 
    0.6,1,0.6
    ]);
else
    colormap([0.2,1,0 
    0.6,1,0 
    1,1,0 
    1,0.6,0 
    1,0.2,0 
    0,0,0
    ]);
end
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 371*2 172*2],'position',[100,100,371*2 172*2]);
set(gca,'FontSize',18,'Position',[-0.15 0.05 0.9 0.9]);
box off

labels = {'畅通','基本畅通','轻度拥堵','中度拥堵','严重拥堵','数据缺失'};
leg = legend(labels,'Position',[0.7 0.15 0.3 0.7],'fontsize',20);
set(leg,'Box','off')
if flag==0
% colormap(pie_colorbar);colorbar()
set(gca,'color',[204/255,204/255,204/255])
set(gca,'ycolor','w');
set(gca,'xcolor','w');
%添加图例

set(leg,'Box','off','TextColor',[1,1,1]);
%添加colorbar

myFileName = [pathDir 'bingtu_new' '.png'];
A=getframe(gcf);
A = A.cdata;
% imwrite(A,myFileName);
%A = imread(myFileName);
%alpha = zeros(449,943);
Alpha = getAlpha(A);
A = A_handle(A);

%imwrite(A,'output2.png','Alpha',Alpha);
% imwrite(A,myFileName,'Alpha',Alpha); %存储调整过大小的图片
end
end
function A = A_handle(A)
[dim1,dim2,dim3]=size(A);
%黑色字体变成白色
for i=1:dim1
    for j=1:dim2
        %i,j,A(i,j,:)
        if (A(i,j,1)<255 &A(i,j,2)<255 & A(i,j,3)<255)
            %i,j
            A(i,j,1)=255;
            A(i,j,2)=255;
            A(i,j,3)=255;
        end
    end
end
%缺失值部分变成黑色
for i=1:dim1
    for j=1:dim2
        %i,j,A(i,j,:)
        if (A(i,j,1)==0.6*255 &A(i,j,2)==255& A(i,j,3)==0.6*255)
            
            A(i,j,1)=0;
            A(i,j,2)=0;
            A(i,j,3)=0;
        end
    end
end

end