clear;
clc;
% close all;

load Result_NLDA;

colorset = [255  0  255;
             0   255  0;
             0    0  255;
             138  43 226;
             0   199 140;
             255 215  0;
             0 0 0;
           ];
       
colorset = colorset./255;

figure;
linewidth = 2;
numindex = 149;
plot(1:numindex,100*Result_NLDA.NLDA_97_61_2(1:numindex),'-','Color',colorset(6,:),'LineWidth',linewidth);
hold on;
grid on;
plot(1:numindex,100*Result_NLDA.NLDA_97_61_3(1:numindex),'-','Color',colorset(5,:),'LineWidth',linewidth);
plot(1:numindex,100*Result_NLDA.NLDA_97_61_4(1:numindex),'-','Color',colorset(4,:),'LineWidth',linewidth);
plot(1:numindex,100*Result_NLDA.NLDA_97_61_5(1:numindex),'-','Color',colorset(3,:),'LineWidth',linewidth);
plot(1:numindex,100*Result_NLDA.NLDA_97_61_6(1:numindex),'-','Color',colorset(2,:),'LineWidth',linewidth);
plot(1:numindex,100*Result_NLDA.NLDA_97_61_7(1:numindex),'-','Color',colorset(1,:),'LineWidth',linewidth);
xlabel('The reduced number of dimensions');
ylabel('Recognition rate (%)');
axis([1 numindex 0 100]);
legend('63','67','64','71','72','73','Location','SouthEast');

% xlswrite('./demo.xls',Result_NLDA.NLDA_63(1:numindex)','sheet1','a2:a150');
% xlswrite('./demo.xls',Result_NLDA.NLDA_67(1:numindex)','sheet1','b2:b150');
% xlswrite('./demo.xls',Result_NLDA.NLDA_64(1:numindex)','sheet1','c2:c150');
% xlswrite('./demo.xls',Result_NLDA.NLDA_71(1:numindex)','sheet1','d2:d150');
% xlswrite('./demo.xls',Result_NLDA.NLDA_72(1:numindex)','sheet1','e2:e150');
% xlswrite('./demo.xls',Result_NLDA.NLDA_73(1:numindex)','sheet1','f2:f150');

disp(max(Result_NLDA.NLDA_97_61_2(1:numindex))*100);
disp(max(Result_NLDA.NLDA_97_61_3(1:numindex))*100);
disp(max(Result_NLDA.NLDA_97_61_4(1:numindex))*100);
disp(max(Result_NLDA.NLDA_97_61_5(1:numindex))*100);
disp(max(Result_NLDA.NLDA_97_61_6(1:numindex))*100);
disp(max(Result_NLDA.NLDA_97_61_7(1:numindex))*100);


title('NLDA on CUFS');
