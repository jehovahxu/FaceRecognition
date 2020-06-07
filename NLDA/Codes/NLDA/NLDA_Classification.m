function NLDA_Result = NLDA_Classification(Methods,Data,nTrain,Database)

for i = 1:length(Methods)
    
    %Synthesized Sketch based Recognition
    TrainData  = [Data{1}.TrSketch Data{i+1}.TrSketch];
    TestData   = Data{1}.TeSketch;
    
    if strcmp(Database,'CUFS')
        nDim = 300;
    else
        nDim = 600;
    end
    
    GalleryData  = Data{i+1}.TeSketch;
    TrainLabel   = [1:nTrain 1:nTrain];
    TestLabel    = [nTrain+1:nTrain+size(TestData,2)];
    GalleryLabel = [nTrain+1:nTrain+size(GalleryData,2)];
    NLDA_Result{i} = NLDA(TrainData,TestData,GalleryData,...
        TrainLabel,TestLabel,GalleryLabel,nDim,Methods{i});
    
end