function draw_tpi(D,trafficIndex,AllComTrafficIndex)
    %2-13��һ��ı仯#5-#4
%     s0 = 10213;
%     starlline = find(trafficIndex{1}==s0*100);
%     y0 = trafficIndex{1}(starlline:starlline+23,2);
%     figure(1);
%     bar(y0);
%     d = 1:1:24;
%     dd = 0:1:23;
%     set(gca,'xtick',d,'xtickLabel',dd);
%      for j=1:1:length(d)
%            text(d(j)-0.3,y0(j)+0.2,num2str(roundn(y0(j),-2)));
%        end
%        title('2017-02-13,#5-#4��ָͨ���仯');
       
   %2-13��һ��ı仯-ȫ����
    s0 = 10213;
    starlline = find(AllComTrafficIndex==s0*100);
    y0 = AllComTrafficIndex(starlline:starlline+23,2);
    figure(1);
    bar(y0);
    d = 1:1:24;
    dd = 0:1:23;
    set(gca,'xtick',d,'xtickLabel',dd);
     for j=1:1:length(d)
           text(d(j)-0.3,y0(j)+0.2,num2str(roundn(y0(j),-2)));
       end
       title('2017-02-13,ȫ����ָͨ���仯');
end