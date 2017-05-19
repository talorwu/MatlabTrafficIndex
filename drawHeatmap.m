function drawHeatmap(heatmap_data,y,place_name)

%����ת��
dir = {'��','��','��','��'};
yy = cell(73,1)
for i=1:73
    yy{i} = num2name(y{i},dir,place_name)
end
    figure(1)
 width=1920;%��ȣ�������
 height=1080;%�߶�
 left=-100;%����Ļ���½�ˮƽ����
 bottem=-100;%����Ļ���½Ǵ�ֱ����
 set(gcf,'position',[left,bottem,width,height])
s=datenum('04-03 00:00:00');
e=datenum('04-09 23:55:00');
d=1/48/6;
xx=datestr((s:d:e)','mm-dd HH:MM:ss')

    load mycolor
    max_color_value = floor(max(max(heatmap_data))/100)*100
    max_color_value = 300
    h = heatmap(heatmap_data',[],yy,[],'TickAngle', 90, 'Colormap',mycolor,'Colorbar', {'NorthOutside'},'NaNColor',[0 0 0],'ShowAllTicks',1,'MinColorValue',0,'MaxColorValue',max_color_value,'TickFontSize',5);
label ='  ����һ                          ���ڶ�                          ������                          ������                          ������                          ������                          ������'
xlabel(label,'FontSize',16)
% ylabel('��ָͨ��','FontSize',18)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 1920 1080],'position',[0,0,1920,1080]);
set(gca,'Position',[0.13 0.08 0.8 0.8])
box off
    %saveas(h,'./2016327_0409/heatmapS.jpg')
end

function [res] = num2name(num,dir,place_name)
    [num1,meiyong] = strsplit(num,'-');
    [num11,meiyong] = strsplit(num1{1},'#');
    real_num1 = str2num(num11{2})
    real_num2 = str2num(num1{2})
    name1 = place_name(real_num1);
    name1 = name1{1};
    name2 = dir(real_num2)
    name2 = name2{1};
    res = [name1 '������' name2];

end