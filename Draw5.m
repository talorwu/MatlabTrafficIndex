function Draw5(AllComTrafficIndex,SNComTrafficIndex,EWComTrafficIndex)
    
%1ƽʱ������������������·����ָͨ���Ա�
d = [1 2 3 4 5 6];
   y = zeros(6,2);
   
   s1 = [90508,90512,90517,91008,91012,91017];
   for i=1:1:5
       y(1,1) = y(1,1) + AllComTrafficIndex(find(AllComTrafficIndex==s1(1)),2);
       y(2,1) = y(2,1) + AllComTrafficIndex(find(AllComTrafficIndex==s1(2)),2);
       y(3,1) = y(3,1) + AllComTrafficIndex(find(AllComTrafficIndex==s1(3)),2);
       %y(2,1) = y(2,1) + AllComTrafficIndex(find(AllComTrafficIndex==s1(4)),2);
       s1(1) = s1(1)+100;
       s1(2) = s1(2)+100;
       s1(3) = s1(3)+100;
   end
      for i=1:1:2
       y(4,1) = y(4,1) + AllComTrafficIndex(find(AllComTrafficIndex==s1(4)),2);
       y(5,1) = y(5,1) + AllComTrafficIndex(find(AllComTrafficIndex==s1(5)),2);
       y(6,1) = y(6,1) + AllComTrafficIndex(find(AllComTrafficIndex==s1(6)),2);
       %y(2,1) = y(2,1) + AllComTrafficIndex(find(AllComTrafficIndex==s1(4)),2);
       s1(4) = s1(4)+100;
       s1(5) = s1(5)+100;
       s1(6) = s1(6)+100;
      end
      
     
   s2 = [92208,92308,92608,92808,92908,92212,92312,92612,92812,92912,92217,92317,92617,92817,92917];
   for i=1:1:5
       y(1,2) = y(1,2) + AllComTrafficIndex(find(AllComTrafficIndex==s2(i)),2);
       y(2,2) = y(2,2) + AllComTrafficIndex(find(AllComTrafficIndex==s2(i+5)),2);
       y(3,2) = y(3,2) + AllComTrafficIndex(find(AllComTrafficIndex==s2(i+10)),2);
   end
   s3 = [92408,92412,92417];
   for i=1:1:2
       y(4,2) = y(4,2) + AllComTrafficIndex(find(AllComTrafficIndex==s3(1)),2);
       y(5,2) = y(5,2) + AllComTrafficIndex(find(AllComTrafficIndex==s3(2)),2);
       y(6,2) = y(6,2) + AllComTrafficIndex(find(AllComTrafficIndex==s3(3)),2);
       %y(2,1) = y(2,1) + AllComTrafficIndex(find(AllComTrafficIndex==s1(4)),2);
       s3(1) = s3(1)+100;
       s3(2) = s3(2)+100;
       s3(3) = s3(3)+100;
   end
   %2�����������ϱ�����Աȣ�ƽ��17:00-18:00
   y(1:3,:) = y(1:3,:)/5;
   y(4:6,:) = y(4:6,:)/2;
   (y(:,1)-y(:,2))./y(:,1) * 100
   yy = zeros(3,2);
   s4 = [90517];
    for i=1:1:5
       yy(1,1) = yy(1,1) + AllComTrafficIndex(find(AllComTrafficIndex==s4(1)),2);
       yy(2,1) = yy(2,1) + SNComTrafficIndex(find(SNComTrafficIndex==s4(1)),2);
       yy(3,1) = yy(3,1) + EWComTrafficIndex(find(EWComTrafficIndex==s4(1)),2);
       yy(1,2) = yy(1,2) + AllComTrafficIndex(find(AllComTrafficIndex==s2(i+10)),2);
       yy(2,2) = yy(2,2) + SNComTrafficIndex(find(SNComTrafficIndex==s2(i+10)),2);
       yy(3,2) = yy(3,2) + EWComTrafficIndex(find(EWComTrafficIndex==s2(i+10)),2);
       s4(1) = s4(1)+100;
   end
   
   yy = yy./5;
   %3�����������½�ͨ���仯��߷壬���磬��߷�
   yyy = zeros(25,4);
   s5 = [90508,90512,90517,905];
   for i=1:1:25
       for j=1:1:3
        yyy(i,j) = AllComTrafficIndex(find(AllComTrafficIndex==s5(j)),2);
       end
       yyy(i,4) = s5(4);
       s5(1:3) = s5(1:3) + 100;
       s5(4) = s5(4) + 1;
      
   end
   %4�����ϱ�ϸ��������ʱ��㣬ʵ��ǰ��Ա�
   
   
   %�����������½�ָͨ���仯��߷壬���磬��߷��ͼ
   d = 1:1:25;
   for i=3:1:3
       figure(i);
       b = bar(yyy(:,i));
       set(gca,'xtick',d,'xtickLabel',yyy(:,4));
       ch = get(b,'children');
       color = [0 0 1;0 0 1;0 0 1;0 0 1;0 0 1;1 1 0;1 1 0;0 0 1;0 0 1;0 0 1;1 1 0;1 1 0;1 1 0;0 0 1;0 0 1;0 0 1;0 0 1;0 0 1;0 0 1;;1 1 0;1 1 0;0 0 1;0 0 1;0 0 1;0 0 1];
       set(ch,'FaceVertexCData',color);
       for j=1:1:length(d)
           text(d(j)-0.3,yyy(j,i)+0.3,num2str(roundn(yyy(j,i),-2)));
       end
       title('������·���߷彻ָͨ���仯');
       
   end
   
   %figure(1);
   %ƽʱ������������������·����ָͨ���ԱȻ�ͼ
%    bar(y);
%    for i =1:length(d)
%          text(d(i)-0.3,y(i,1)+0.3,num2str(y(i,1)));
%          text(d(i)+0.1,y(i,2)+0.3,num2str(y(i,2)));
%    end
%    text(d(2), -0.5, '������');
%    text(d(5), -0.5, '��ĩ');
%    title('ƽ�պ���ĩ�Ľ�ָͨ��');
%    XX = {'8ʱ','12ʱ','17ʱ','8ʱ','12ʱ','17ʱ'};
%    set(gca,'xtick',d,'xtickLabel',XX);

%�����������ϱ�����Աȣ�ƽ��17:00-18:00��ͼ
% d = [1,2,3]
%     bar(yy);
%     for i =1:length(d)
%           text(d(i)-0.3,yy(i,1)+0.3,num2str(yy(i,1)));
%           text(d(i)+0.1,yy(i,2)+0.3,num2str(yy(i,2)));
%     end
%     title('ƽ����߷彻ָͨ����������Ա�');
%     XX = {'ȫ����','�ϱ�����','��������'};
%     set(gca,'xtick',d,'xtickLabel',XX);
%    
    
   
   
    %     for j=1:1:42
%        scrsz = get(0,'ScreenSize');
%         figure('Position',scrsz);
%     y = [count(j) count2(j) D{j}(6:10,2)']
%     bar(y);
%     title('��ͨ�����Ա�');
%     set(gca,'xtick',d,'xtickLabel',XX);
%     set(gca,'YLim',[0 count2(j)+10000]);%Y���������ʾ��Χ
%     %set(gcf,'paperpositionmode','auto');
%     %set(gcf,'position',[100,100, 1000, 600]); 
%     
%     
%     for i =1:length(d)
%         text(d(i)-0.2,y(i)+2000,num2str(y(i)));
%     end
%     filename = ['C:\Users\admin\Documents\MATLAB\ͼ\����_����ʱ��\·������10��00-16��00\#',num2str(CrossNum(j)),'.jpg']
%     A=getframe(gcf);                                     
% 
%     imwrite(A.cdata,filename)
%     end
end