clear all
close all
clc

addpath('Codes/Utilities');
addpath('Codes/Eigenface');
addpath('Codes/Fisherface');

setEnvironment;

% folders are of the same name
Methods = {'RSLCR', 'RSLCR', 'FCN', 'MRNF', 'BP-GAN', 'pix2pix', ...
    'pix_FAL_1', 'pix_FAL_2', 'pix_FAL_3', 'pix_FAL_4', ...
    'E7', 'R7_r9', 'E6E7', 'E6R7_r3', 'E6R7_r9', 'R6R7_r9' }; 
% folder of the ground-truth images
folderGT = 'SAGAN-GR';

itrN = 20; 
methodN = length(Methods);
AccList.Fisher = zeros(itrN, methodN);
AccList.Eigen = zeros(itrN, methodN);
AccList.NLDA = zeros(itrN, methodN);

for itr = 1:itrN
    
    fprintf('iteration : %s \n', itr)

    load([PathResult,'Fisherface_Result_', num2str(itr), '.mat']);
    load([PathResult, 'Eigenface_Result_', num2str(itr), '.mat']);
    load([PathResult, 'NLDA_Result_', num2str(itr), '.mat']);


    for iMethod = 1:methodN
        AccList.Fisher(itr, iMethod) = Fisherface_Result{iMethod}.accuracy;
        AccList.Eigen(itr, iMethod) = Fisherface_Result{iMethod}.accuracy;
        AccList.NLDA(itr, iMethod) = NLDA_Result{iMethod}.accuracy;
    end
    
end

AccList.avgFisher = mean(AccList.Fisher);
AccList.avgEigen = mean(AccList.Eigen);
AccList.avgNLDA = mean(AccList.NLDA);
AccList.stdFisher = std(AccList.Fisher);
AccList.stdEigen = std(AccList.Eigen);
AccList.stdNLDA = std(AccList.NLDA);

save ResultAnalysis AccList