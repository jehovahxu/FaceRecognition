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
plot(1:numindex,100*Result_NLDA.NLDA_97_51_1_2(1:numindex),'-','Color',colorset(6,:),'LineWidth',linewidth);
hold on;
grid on;
xlabel('The reduced number of dimensions');
ylabel('Recognition rate (%)');
axis([1 numindex 0 100]);
legend('63','Location','SouthEast');


disp(max(Result_NLDA.NLDA_97_51_1_2(1:numindex))*100);


title('NLDA on CUFS');
