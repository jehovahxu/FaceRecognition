function Result = NLDA(TrainData,TestData,GalleryData,TrainLabel,TestLabel,GalleryLabel,nDim,Method)

counter  = 1;
accuracy = 0;

TrainData = double(TrainData);
TestData  = double(TestData);
GalleryData = double(GalleryData);

% options.ReducedDim = length(TrainLabel) - 1;

options.ReducedDim = nDim;

[EVec EVal] = PCA(TrainData',options);

tempData = EVec'*TrainData;

[EVec2 EVal2] = calNLDAProjectionMat(tempData,TrainLabel,[]);

for ndim = 1:length(EVal2)
    
    fprintf('NLDA, %s, ndim=%d/%d The best accuracy is %f\n',Method,ndim,...
        length(EVal2),accuracy);
    
    ProjTest    = (EVec*EVec2(:,1:ndim))'*TestData;
    ProjGallery = (EVec*EVec2(:,1:ndim))'*GalleryData;
    
    Distance = EuDist2(ProjTest',ProjGallery');
    [distance index] = sort(Distance');
    
    PredictLabel = GalleryLabel(index(1,:)');
    
    rate = sum(PredictLabel == TestLabel)/length(TestLabel);
    
    RecRate(counter) = rate;
    counter = counter + 1;
    
    if rate > accuracy
        
        accuracy = rate;
        feadim   = ndim;
        Basis    = EVec;
        
    end
    
end    

% figure;
% plot([1:Maxdim],RecRate);
% hold on;
% plot([1:Maxdim],RecRate,'r*');

Result.RecRate  = RecRate;
Result.accuracy = accuracy;
Result.feadim   = feadim;
Result.Basis    = EVec;