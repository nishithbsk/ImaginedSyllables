load('/Users/nishithkhandwala/Desktop/CS229_Project/data/CS229_speech_imagery.mat');

numBa = 80; numKu = 73; numIm = 178; numSi = 172;

numChannels = 67; timeSpan = 1351;

ba = zeros(numChannels, timeSpan);

for indexFile = (101:180)
    fileName = strcat('S',num2str(indexFile));
    fileName = eval(fileName);
    ba = ba + fileName.F;
end

ba = ba ./ numBa;

startTime = 101; endTime = 1201;
ba = ba(:, startTime:endTime);

numParts = 8;

[numRows, numCols] = size(ba);
partSize = floor(numCols/numParts);

partsArray = zeros(numChannels, numParts);

for i = (1:numParts)
   partsArray(:, i) = mean(ba(:, 1 + (i-1) * partSize : (i * partSize)), 2);
end

featureVector = reshape(partsArray, [1 numParts * numChannels]);




