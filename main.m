% ==========================================================================
% NLDA: Face Recognition based on Synthesized Sketches
% Written by Nannan Wang
% 2016.10.26
% Xidian University
% nnwang@xidian.edu.cn
% ==========================================================================
% Modified by JacobShi777


clear;
clc;
close all;

addpath('Codes/Utilities');
addpath('Codes/NLDA');

% Database = 'CUFS';
Database = 'CUFSF';
Methods = {'/data/xxx/cagan_2/cagan_vggface_sketch/output/700','/data/xxx/cagan_2/scagan_vggface_2/out/500'}
refDir = '/data/xxx/photosketch/CUFSF_sketches_944/';

Path = ['/',''];

nTrain = 300;
nTotal = 944;
% nTrain = 150;
% nTotal = 338;

lenM = size(Methods, 2);
NLDA_value = cell(1, lenM);
for i = 1 : lenM
    NLDA_value{i} = zeros(1,nTrain-1);
end

ntest = 20;

for counter = 1:ntest
    
    fprintf('Random test %d/%d\n',counter,ntest);
    
    index = randperm(nTotal);
    trainindex = index(1:nTrain);
    testindex  = index(nTrain+1:end);
    Data = LoadAllData(trainindex,testindex,Path,Methods, refDir);
    
    index_set(counter).trainindex = trainindex;
    index_set(counter).testindex  = testindex;
    
    NLDA_Result = NLDA_Classification(Methods,Data,nTrain,Database);
   
    for j = 1:lenM
        NLDA_value{j} = NLDA_Result{j}.RecRate + NLDA_value{j};
    end
       
end

fprintf('=======NLDA=======\n');
for j = 1:lenM
    NLDA_value{j} = NLDA_value{j}/ntest;
    fprintf('Method_%s: %f\n', Methods{j}, max(NLDA_value{j}*100));
end


