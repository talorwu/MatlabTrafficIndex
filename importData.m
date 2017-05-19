function [CrossNum,D2CrossIndex,CrossIndex2D,D] = importData(timePart)
    if strcmp(timePart,'day')
    D5_4 = importdata('F:\resultByDay10_16\611471007000-611471008000.txt');
    D4_5 = importdata('F:\resultByDay10_16\611471008000-611471007000.txt');
    
    D5_15 = importdata('F:\resultByDay10_16\611471007000-611661003000.txt');
    D15_5 = importdata('F:\resultByDay10_16\611661003000-611471007000.txt');
    
    D31_33 = importdata('F:\resultByDay10_16\611681005000-611671004000.txt');
    D33_31 = importdata('F:\resultByDay10_16\611671004000-611681005000.txt');
    
    D33_4 = importdata('F:\resultByDay10_16\611671004000-611471008000.txt');
    D4_33 = importdata('F:\resultByDay10_16\611471008000-611671004000.txt');
    
    D10_23 = importdata('F:\resultByDay10_16\611471003000-611501001000.txt');
    D23_10 = importdata('F:\resultByDay10_16\611501001000-611471003000.txt');
    
    D19_15 = importdata('F:\resultByDay10_16\610401009001-611661003000.txt');
    D15_19 = importdata('F:\resultByDay10_16\611661003000-610401009001.txt');
    
    D19_24 = importdata('F:\resultByDay10_16\610401009001-610401004000.txt');
    D24_19 = importdata('F:\resultByDay10_16\610401004000-610401009001.txt');
    
    D28_24 = importdata('F:\resultByDay10_16\610401001001-610401004000.txt');
    D24_28 = importdata('F:\resultByDay10_16\610401004000-610401001001.txt');
    
    D27_24 = importdata('F:\resultByDay10_16\712021001001-610401004000.txt');
    D24_27 = importdata('F:\resultByDay10_16\610401004000-712021001001.txt');
    
    D12_24 = importdata('F:\resultByDay10_16\611721008000-610401004000.txt');
    D24_12 = importdata('F:\resultByDay10_16\610401004000-611721008000.txt');
   
    D12_43 = importdata('F:\resultByDay10_16\611721008000-611721007001.txt');
    D43_12 = importdata('F:\resultByDay10_16\611721007001-611721008000.txt');
    
    D8_43 = importdata('F:\resultByDay10_16\611471001000-611721007001.txt');
    D43_8 = importdata('F:\resultByDay10_16\611721007001-611471001000.txt');
    
    D4_10 = importdata('F:\resultByDay10_16\611471008000-611471003000.txt');
    D10_4 = importdata('F:\resultByDay10_16\611471003000-611471008000.txt');
    
    D10_6 = importdata('F:\resultByDay10_16\611471003000-611471004000.txt');
    D6_10 = importdata('F:\resultByDay10_16\611471004000-611471003000.txt');
    
    D6_7 = importdata('F:\resultByDay10_16\611471004000-611471005000.txt');
    D7_6 = importdata('F:\resultByDay10_16\611471005000-611471004000.txt');
    
    D6_12 = importdata('F:\resultByDay10_16\611471004000-611721008000.txt');
    D12_6 = importdata('F:\resultByDay10_16\611721008000-611471004000.txt');
    
    D7_8 = importdata('F:\resultByDay10_16\611471005000-611471001000.txt');
    D8_7 = importdata('F:\resultByDay10_16\611471001000-611471005000.txt');
    
    D8_11 = importdata('F:\resultByDay10_16\611471001000-611721009001.txt');
    D11_8 = importdata('F:\resultByDay10_16\611721009001-611471001000.txt');
    
    D11_13 = importdata('F:\resultByDay10_16\611721009001-611721005000.txt');
    D13_11 = importdata('F:\resultByDay10_16\611721005000-611721009001.txt');
    
    D2_17= importdata('F:\resultByDay10_16\601571005000-601571004000.txt');
    D17_2= importdata('F:\resultByDay10_16\601571004000-601571005000.txt');
   
    D17_8= importdata('F:\resultByDay10_16\601571004000-611471001000.txt');
    D8_17= importdata('F:\resultByDay10_16\611471001000-601571004000.txt');
    elseif strcmp(timePart , 'hour')
    D5_4 = importdata('F:\resultByHour213-219\611471007000-611471008000.txt');
    D4_5 = importdata('F:\resultByHour213-219\611471008000-611471007000.txt');
    
    D5_15 = importdata('F:\resultByHour213-219\611471007000-611661003000.txt');
    D15_5 = importdata('F:\resultByHour213-219\611661003000-611471007000.txt');
    
    D31_33 = importdata('F:\resultByHour213-219\611681005000-611671004000.txt');
    D33_31 = importdata('F:\resultByHour213-219\611671004000-611681005000.txt');
    
    D33_4 = importdata('F:\resultByHour213-219\611671004000-611471008000.txt');
    D4_33 = importdata('F:\resultByHour213-219\611471008000-611671004000.txt');
    
    D10_23 = importdata('F:\resultByHour213-219\611471003000-611501001000.txt');
    D23_10 = importdata('F:\resultByHour213-219\611501001000-611471003000.txt');
    
    D19_15 = importdata('F:\resultByHour213-219\610401009001-611661003000.txt');
    D15_19 = importdata('F:\resultByHour213-219\611661003000-610401009001.txt');
    
    D19_24 = importdata('F:\resultByHour213-219\610401009001-610401004000.txt');
    D24_19 = importdata('F:\resultByHour213-219\610401004000-610401009001.txt');
    
    D28_24 = importdata('F:\resultByHour213-219\610401001001-610401004000.txt');
    D24_28 = importdata('F:\resultByHour213-219\610401004000-610401001001.txt');
    
    D27_24 = importdata('F:\resultByHour213-219\712021001001-610401004000.txt');
    D24_27 = importdata('F:\resultByHour213-219\610401004000-712021001001.txt');
    
    D12_24 = importdata('F:\resultByHour213-219\611721008000-610401004000.txt');
    D24_12 = importdata('F:\resultByHour213-219\610401004000-611721008000.txt');
   
    D12_43 = importdata('F:\resultByHour213-219\611721008000-611721007001.txt');
    D43_12 = importdata('F:\resultByHour213-219\611721007001-611721008000.txt');
    
    D8_43 = importdata('F:\resultByHour213-219\611471001000-611721007001.txt');
    D43_8 = importdata('F:\resultByHour213-219\611721007001-611471001000.txt');
    
    D4_10 = importdata('F:\resultByHour213-219\611471008000-611471003000.txt');
    D10_4 = importdata('F:\resultByHour213-219\611471003000-611471008000.txt');
    
    D10_6 = importdata('F:\resultByHour213-219\611471003000-611471004000.txt');
    D6_10 = importdata('F:\resultByHour213-219\611471004000-611471003000.txt');
    
    D6_7 = importdata('F:\resultByHour213-219\611471004000-611471005000.txt');
    D7_6 = importdata('F:\resultByHour213-219\611471005000-611471004000.txt');
    
    D6_12 = importdata('F:\resultByHour213-219\611471004000-611721008000.txt');
    D12_6 = importdata('F:\resultByHour213-219\611721008000-611471004000.txt');
    
    D7_8 = importdata('F:\resultByHour213-219\611471005000-611471001000.txt');
    D8_7 = importdata('F:\resultByHour213-219\611471001000-611471005000.txt');
    
    D8_11 = importdata('F:\resultByHour213-219\611471001000-611721009001.txt');
    D11_8 = importdata('F:\resultByHour213-219\611721009001-611471001000.txt');
    
    D11_13 = importdata('F:\resultByHour213-219\611721009001-611721005000.txt');
    D13_11 = importdata('F:\resultByHour213-219\611721005000-611721009001.txt');
    
    D2_17= importdata('F:\resultByHour213-219\601571005000-601571004000.txt');
    D17_2= importdata('F:\resultByHour213-219\601571004000-601571005000.txt');
   
    D17_8= importdata('F:\resultByHour213-219\601571004000-611471001000.txt');
    D8_17= importdata('F:\resultByHour213-219\611471001000-601571004000.txt');
    elseif strcmp(timePart , 'minute5')
    D5_4 = importdata('F:\resultByMinute5_20161202\611471007000-611471008000.txt');
    D4_5 = importdata('F:\resultByMinute5_20161202\611471008000-611471007000.txt');
    
    D5_15 = importdata('F:\resultByMinute5_20161202\611471007000-611661003000.txt');
    D15_5 = importdata('F:\resultByMinute5_20161202\611661003000-611471007000.txt');
    
    D31_33 = importdata('F:\resultByMinute5_20161202\611681005000-611671004000.txt');
    D33_31 = importdata('F:\resultByMinute5_20161202\611671004000-611681005000.txt');
    
    D33_4 = importdata('F:\resultByMinute5_20161202\611671004000-611471008000.txt');
    D4_33 = importdata('F:\resultByMinute5_20161202\611471008000-611671004000.txt');
    
    D10_23 = importdata('F:\resultByMinute5_20161202\611471003000-611501001000.txt');
    D23_10 = importdata('F:\resultByMinute5_20161202\611501001000-611471003000.txt');
    
    D19_15 = importdata('F:\resultByMinute5_20161202\610401009001-611661003000.txt');
    D15_19 = importdata('F:\resultByMinute5_20161202\611661003000-610401009001.txt');
    
    D19_24 = importdata('F:\resultByMinute5_20161202\610401009001-610401004000.txt');
    D24_19 = importdata('F:\resultByMinute5_20161202\610401004000-610401009001.txt');
    
    D28_24 = importdata('F:\resultByMinute5_20161202\610401001001-610401004000.txt');
    D24_28 = importdata('F:\resultByMinute5_20161202\610401004000-610401001001.txt');
    
    D27_24 = importdata('F:\resultByMinute5_20161202\712021001001-610401004000.txt');
    D24_27 = importdata('F:\resultByMinute5_20161202\610401004000-712021001001.txt');
    
    D12_24 = importdata('F:\resultByMinute5_20161202\611721008000-610401004000.txt');
    D24_12 = importdata('F:\resultByMinute5_20161202\610401004000-611721008000.txt');
   
    D12_43 = importdata('F:\resultByMinute5_20161202\611721008000-611721007001.txt');
    D43_12 = importdata('F:\resultByMinute5_20161202\611721007001-611721008000.txt');
    
    D8_43 = importdata('F:\resultByMinute5_20161202\611471001000-611721007001.txt');
    D43_8 = importdata('F:\resultByMinute5_20161202\611721007001-611471001000.txt');
    
    D4_10 = importdata('F:\resultByMinute5_20161202\611471008000-611471003000.txt');
    D10_4 = importdata('F:\resultByMinute5_20161202\611471003000-611471008000.txt');
    
    D10_6 = importdata('F:\resultByMinute5_20161202\611471003000-611471004000.txt');
    D6_10 = importdata('F:\resultByMinute5_20161202\611471004000-611471003000.txt');
    
    D6_7 = importdata('F:\resultByMinute5_20161202\611471004000-611471005000.txt');
    D7_6 = importdata('F:\resultByMinute5_20161202\611471005000-611471004000.txt');
    
    D6_12 = importdata('F:\resultByMinute5_20161202\611471004000-611721008000.txt');
    D12_6 = importdata('F:\resultByMinute5_20161202\611721008000-611471004000.txt');
    
    D7_8 = importdata('F:\resultByMinute5_20161202\611471005000-611471001000.txt');
    D8_7 = importdata('F:\resultByMinute5_20161202\611471001000-611471005000.txt');
    
    D8_11 = importdata('F:\resultByMinute5_20161202\611471001000-611721009001.txt');
    D11_8 = importdata('F:\resultByMinute5_20161202\611721009001-611471001000.txt');
    
    D11_13 = importdata('F:\resultByMinute5_20161202\611721009001-611721005000.txt');
    D13_11 = importdata('F:\resultByMinute5_20161202\611721005000-611721009001.txt');
    
    D2_17= importdata('F:\resultByMinute5_20161202\601571005000-601571004000.txt');
    D17_2= importdata('F:\resultByMinute5_20161202\601571004000-601571005000.txt');
   
    D17_8= importdata('F:\resultByMinute5_20161202\601571004000-611471001000.txt');
    D8_17= importdata('F:\resultByMinute5_20161202\611471001000-601571004000.txt');
    end

    %取出数据
    maxrows = 42;
    D=cell(maxrows,1);
    CrossNum = zeros(42,1);
    D5_4data = D5_4.data;
    %m = size(D5_4data)
    D{1} = D5_4data;
    CrossNum(1) = 5;
    D4_5data = D4_5.data;
    D{2} = D4_5data;
    CrossNum(2) = 4;
    D5_15data = D5_15.data;
    D{3} = D5_15data;
    CrossNum(3) = 5;
    D15_5data = D15_5.data;
    D{4} = D15_5data;
    CrossNum(4) = 15;
    D31_33data = D31_33.data;
    D{5} = D31_33data;
    CrossNum(5) = 31;
    %m = size(D31_33data)
    D33_31data = D33_31.data;
    D{6} = D33_31data;
    CrossNum(6) = 33;
    D33_4data = D33_4.data;
    D{7} = D33_4data;
    CrossNum(7) = 33;
    D4_33data = D4_33.data;
    D{8} = D4_33data;
    CrossNum(8) = 4;
    D10_23data = D10_23.data;
    D{9} = D10_23data;
    CrossNum(9) = 10;
    D23_10data = D23_10.data;
    D{10} = D23_10data;
    CrossNum(10) = 23;
    D19_15data = D19_15.data;
    D{11} = D19_15data;
    CrossNum(11) = 19;
    D15_19data = D15_19.data;
    D{12} = D15_19data;
    CrossNum(12) = 15;
    D19_24data = D19_24.data;
    D{13} = D19_24data;
    CrossNum(13) = 19;
    D24_19data = D24_19.data;
    D{14} = D24_19data;
    CrossNum(14) = 24;
    D28_24data = D28_24.data;
    D{15} = D28_24data;
    CrossNum(15) = 28;
    D24_28data = D24_28.data;
    D{16} = D24_28data;
    CrossNum(16) = 24;
    D27_24data = D27_24.data;
    D{17} = D27_24data;
    CrossNum(17) = 27;
    D24_27data = D24_27.data;
    D{18} = D24_27data;
    CrossNum(18) = 24;
    D12_24data = D12_24.data;
    D{19} = D12_24data;
    CrossNum(19) = 12;
    D24_12data = D24_12.data;
    D{20} = D24_12data;
    CrossNum(20) = 24;
    D12_43data = D12_43.data;
    D{21} = D12_43data;
    CrossNum(21) = 12;
    D43_12data = D43_12.data;
    D{22} = D43_12data;
    CrossNum(22) = 43;
    D8_43data = D8_43.data;
    D{23} = D8_43data;
    CrossNum(23) = 8;
    D43_8data = D43_8.data;
    D{24} = D43_8data;
    CrossNum(24) = 43;
    D4_10data = D4_10.data;
    D{25} = D4_10data;
    CrossNum(25) = 4;
    D10_4data = D10_4.data;
    D{26} = D10_4data;
    CrossNum(26) = 10;
    D10_6data = D10_6.data;
    D{27} = D10_6data;
    CrossNum(27) = 10;
    D6_10data = D6_10.data;
    D{28} = D6_10data;
    CrossNum(28) = 6;
    D6_7data = D6_7.data;
    D{29} = D6_7data;
    CrossNum(29) = 6;
    D7_6data = D7_6.data;
    D{30} = D7_6data;
    CrossNum(30) = 7;
    D6_12data = D6_12.data;
    D{31} = D6_12data;
    CrossNum(31) = 6;
    D12_6data = D12_6.data;
    D{32}= D12_6data;
    CrossNum(32) = 12;
    D7_8data = D7_8.data;
    D{33} = D7_8data;
    CrossNum(33) = 7;
    D8_7data = D8_7.data;
    D{34}= D8_7data;
    CrossNum(34) = 8;
    D8_11data = D8_11.data;
    D{35} = D8_11data;
    CrossNum(35) = 8;
    D11_8data = D11_8.data;
    D{36} = D11_8data;
    CrossNum(36) = 11;
    D11_13data = D11_13.data;
    D{37}= D11_13data;
    CrossNum(37) = 11;
    D13_11data = D13_11.data;
    D{38} = D13_11data;
    CrossNum(38) = 13;
    D2_17data = D2_17.data;
    D{39}= D2_17data;
    CrossNum(39) = 2;
    D17_2data = D17_2.data;
    D{40} = D17_2data;
    CrossNum(40) = 17;
    D8_17data = D8_17.data;
    D{41} = D8_17data;
    CrossNum(41) = 8;
    D17_8data = D17_8.data;
    D{42} = D17_8data;
    CrossNum(42) = 17;
    
    %按照时间排序
   for i=1:1:maxrows
       tmp = D{i};
       %[row, col] = size(tmp);
       if strcmp(timePart , 'hour')
          tmp(:,1) = int32(tmp(:,1)- 2016000000);
          tmp(:,4) = tmp(:,4)/5;
       elseif strcmp(timePart , 'day')
           tmp(:,1) = int32(tmp(:,1)- 20160000);
          % tmp(:,5) = tmp(:,5)/5;
       end
       D{i} = sortrows(tmp,1);
   end
   
   %创建对应的映射
   CrossIndex2D = containers.Map();
   D2CrossIndex = cell(maxrows,1);
   D2CrossIndex{1} = '#5-#4';CrossIndex2D('#5-#4') = 1;
   D2CrossIndex{2} = '#4-#5';CrossIndex2D('#4-#5') = 2;
   D2CrossIndex{3} = '#5-#15';CrossIndex2D('#5-#15') = 3;
   D2CrossIndex{4} = '#15-#5';CrossIndex2D('#15-#5') = 4;
   D2CrossIndex{5} = '#31-#33';CrossIndex2D('#31-#33') = 5;
   D2CrossIndex{6} = '#33-#31';CrossIndex2D('#33-#31') = 6;
   D2CrossIndex{7} = '#33-#4';CrossIndex2D('#33-#4') = 7;
   D2CrossIndex{8} = '#4-#33';CrossIndex2D('#4-#33') = 8;
   D2CrossIndex{9} = '#10-#23';CrossIndex2D('#10-#23') = 9;
   D2CrossIndex{10} = '#23-#10';CrossIndex2D('#23-#10') = 10;
   D2CrossIndex{11} = '#19-#15';CrossIndex2D('#19-#15') = 11;
   D2CrossIndex{12} = '#15-#19';CrossIndex2D('#15-#19') = 12;
   D2CrossIndex{13} = '#19-#24';CrossIndex2D('#19-#24') = 13;
   D2CrossIndex{14} = '#24-#19';CrossIndex2D('#24-#19') = 14;
   D2CrossIndex{15} = '#28-#24';CrossIndex2D('#28-#24') = 15;
   D2CrossIndex{16} = '#24-#28';CrossIndex2D('#24-#28') = 16;
   D2CrossIndex{17} = '#27-#24';CrossIndex2D('#27-#24') = 17;
   D2CrossIndex{18} = '#24-#27';CrossIndex2D('#24-#27') = 18;
   D2CrossIndex{19} = '#12-#24';CrossIndex2D('#12-#24') = 19;
   D2CrossIndex{20} = '#24-#12';CrossIndex2D('#24-#12') = 20;
   D2CrossIndex{21} = '#12-#43';CrossIndex2D('#12-#43') = 21;
   D2CrossIndex{22} = '#43-#12';CrossIndex2D('#43-#12') = 22;
   D2CrossIndex{23} = '#8-#43';CrossIndex2D('#8-#43') = 23;
   D2CrossIndex{24} = '#43-#8';CrossIndex2D('#43-#8') = 24;
   D2CrossIndex{25} = '#4-#10';CrossIndex2D('#4-#10') = 25;
   D2CrossIndex{26} = '#10-#4';CrossIndex2D('#10-#4') = 26;
   D2CrossIndex{27} = '#10-#6';CrossIndex2D('#10-#6') = 27;
   D2CrossIndex{28} = '#6-#10';CrossIndex2D('#6-#10') = 28;
   D2CrossIndex{29} = '#6-#7';CrossIndex2D('#6-#7') = 29;
   D2CrossIndex{30} = '#7-#6';CrossIndex2D('#7-#6') = 30;
   D2CrossIndex{31} = '#6-#12';CrossIndex2D('#6-#12') = 31;
   D2CrossIndex{32} = '#12-#6';CrossIndex2D('#12-#6') = 32;
   D2CrossIndex{33} = '#7-#8';CrossIndex2D('#7-#8') = 33;
   D2CrossIndex{34} = '#8-#7';CrossIndex2D('#8-#7') = 34;
   D2CrossIndex{35} = '#8-#11';CrossIndex2D('#8-#11') = 35;
   D2CrossIndex{36} = '#11-#8';CrossIndex2D('#11-#8') = 36;
   D2CrossIndex{37} = '#11-#13';CrossIndex2D('#11-#13') = 37;
   D2CrossIndex{38} = '#13-#11';CrossIndex2D('#13-#11') = 38;
   D2CrossIndex{39} = '#2-#17';CrossIndex2D('#2-#17') = 39;
   D2CrossIndex{40} = '#17-#2';CrossIndex2D('#17-#2') = 40;
   D2CrossIndex{41} = '#8-#17';CrossIndex2D('#8-#17') = 41;
   D2CrossIndex{42} = '#17-#8';CrossIndex2D('#17-#8') = 42;
   
end