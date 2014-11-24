function syllableFeatureVector = obtainSyllableFeatureVector(startFileNumber, endFileNumber)

load('/Users/nishithkhandwala/Desktop/CS229_Project/data/CS229_speech_imagery.mat');

numChannels = 67; timeSpan = 1351;

syllable = zeros(numChannels, timeSpan);

for indexFile = (startFileNumber:endFileNumber)
    fileName = strcat('S',num2str(indexFile));
    fileName = eval(fileName);
    syllable = syllable + fileName.F;
end

syllable = syllable ./ (endFileNumber - startFileNumber + 1);

startTime = 101; endTime = 1201;
syllable = syllable(:, startTime:endTime);

numParts = 8;

[~, numCols] = size(syllable);
partSize = floor(numCols/numParts);

partsArray = zeros(numChannels, numParts);

for i = (1:numParts)
   partsArray(:, i) = mean(syllable(:, 1 + (i-1) * partSize : (i * partSize)), 2);
end

syllableFeatureVector = reshape(partsArray, [1 numParts * numChannels]);

end