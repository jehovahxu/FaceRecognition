function [TrSketch TeSketch] = LoadData(trainindex,testindex,Path,Method)

TrSketch = [];
TeSketch = [];

for i = 1:length(trainindex)
    
    sketch      = imread([Path,Method,'/',num2str(trainindex(i)),'.jpg']);
    if size(sketch,3) == 3
        sketch = rgb2gray(sketch);
    end
    TrSketch = [TrSketch sketch(:)];
    
end
TrSketch = double(TrSketch);

for i = 1:length(testindex)
    
    sketch      = imread([Path,Method,'/',num2str(testindex(i)),'.jpg']);
    if size(sketch,3) == 3
        sketch = rgb2gray(sketch);
    end
    TeSketch = [TeSketch sketch(:)];
    
end
TeSketch = double(TeSketch);