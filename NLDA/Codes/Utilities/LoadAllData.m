function Data = LoadAllData(trainindex,testindex,Path,Methods, refDir)

Data{1}.trainindex = trainindex;
Data{1}.testindex  = testindex;

lenM = size(Methods, 2);
Methods2(2:lenM+1) = Methods;
Methods2{1}   = refDir;

for i = 1:length(Methods2)
    
    [TrSketch TeSketch] = LoadData(trainindex,testindex,Path,Methods2{i});
    Data{i}.TrSketch = TrSketch;
    Data{i}.TeSketch = TeSketch;
    
end


