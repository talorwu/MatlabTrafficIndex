
%һ��ı仯����
function Draw(startTime,endtime,road,D,CrossIndex2D,timePart,singleCrossW)
    index = CrossIndex2D(road)
    [rows,cols] = find(D{index}==startTime);
    [rowe,cole] = find(D{index}==endtime);
    tmpMa1 = D{index}(rows:rowe,:);
    [n1 , n2] = size(tmpMa1);
    nDim = 0;
    if strcmp(timePart,'day')
        nDim = 4;
    elseif strcmp(timePart , 'hour')
        nDim = 3;
    end
    tmpMa=zeros(n1,n2+1);
    tmpMa(:,1:nDim+1) = tmpMa1;
    for i=1:nDim
        tmpMa(:,nDim+2) = tmpMa(:,nDim+2) + tmpMa(:,i+1)*singleCrossW{index}(i);
    end
    %����״ͼ
    
     bar(tmpMa(:,2:nDim+2));
     d=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23];
     set(gca,'xtick',d,'xtickLabel',tmpMa(:,1));
     title([road,'����ָ��']);
     xlabel('ʱ��');  %x��
     
     %hold on;
%      bar(tmpMa(:,3));
%      d=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23];
%      set(gca,'xtick',d,'xtickLabel',tmpMa(:,1));
%      title([road,'��·���Ͷ�']);
%      xlabel('��·���Ͷ�');  %x��
%      ylabel('ʱ��');%y��
    
end