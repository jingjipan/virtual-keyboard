function [trainingDatax,testDatax,trainingDatay,testy] = datamult(f1,f2,f3,f4,f5)

r = randperm(10,5);
testDatax=[];
trainingDatax = [];
testDatax=[testDatax;f1(r(1),:)];
testDatax=[testDatax;f2(r(2),:)];
testDatax=[testDatax;f3(r(3),:)];
testDatax=[testDatax;f4(r(4),:)];
testDatax=[testDatax;f5(r(5),:)];

f1(r(1),:)=[];
f2(r(2),:)=[];
f3(r(3),:)=[];
f4(r(4),:)=[];
f5(r(5),:)=[];
trainingDatax=[trainingDatax;f1];
trainingDatax=[trainingDatax;f2];
trainingDatax=[trainingDatax;f3];
trainingDatax=[trainingDatax;f4];
trainingDatax=[trainingDatax;f5];

trainingy=[];
for i=1:9
    trainingy=[trainingy;[1 0 0 0 0]];
end
for i=1:9
    trainingy=[trainingy;[0 1 0 0 0]];
end
for i=1:9
    trainingy=[trainingy;[0 0 1 0 0]];
end
for i=1:9
    trainingy=[trainingy;[0 0 0 1 0]];
end
for i=1:9
    trainingy=[trainingy;[0 0 0 0 1]];
end
testy=eye(5);



trainingData = [];

trainingData = [trainingDatax trainingy];
trainingData = trainingData(randperm(size(trainingData,1)),:);

trainingDatax = trainingData(:,1:size(trainingData,2)-5);
trainingDatay = trainingData(:,size(trainingData,2)-4:size(trainingData,2));



end
