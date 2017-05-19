%画一天的变化
function Draw7(D)
    bar(D);
    d=1:1:24;
    dd = 0:1:23;
    set(gca,'xtick',d,'xtickLabel',dd);
    for j=1:1:length(d)
            text(d(j)-0.3,D(j)+0.3,num2str(roundn(D(j),-2))); 
     end
end