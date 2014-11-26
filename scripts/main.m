load('/Users/nishithkhandwala/Desktop/CS229_Project/data/CS229_speech_imagery.mat');

baFeatureVector = aggregateMeanFeatureExtractor(101, 180);
kuFeatureVector = aggregateMeanFeatureExtractor(201, 273);
imFeatureVector = aggregateMeanFeatureExtractor(3001, 3178);
siFeatureVector = aggregateMeanFeatureExtractor(4001, 4172);

featureVector = [baFeatureVector; kuFeatureVector; imFeatureVector; siFeatureVector];