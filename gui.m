close all
clear all
clc
fid1 = 'C:\\Users\\Jingji Pan\\Desktop\\comp4190ass2\\Myo Keyboard Data\\Right\\accelerometer-1456704146.csv';
fid2 = 'C:\\Users\\Jingji Pan\\Desktop\\comp4190ass2\\Myo Keyboard Data\\Backward\\accelerometer-1456704054.csv';
fid3 ='C:\\Users\\Jingji Pan\\Desktop\\comp4190ass2\\Myo Keyboard Data\\Enter\\accelerometer-1456704184.csv';
fid4 = 'C:\\Users\\Jingji Pan\\Desktop\\comp4190ass2\\Myo Keyboard Data\\Forward\\accelerometer-1456703940.csv';
fid5 = 'C:\\Users\\Jingji Pan\\Desktop\\comp4190ass2\\Myo Keyboard Data\\Left\\accelerometer-1456704106.csv';

f1 = compass2(fid1);
f2 = compass2(fid2);
f3 = compass2(fid3);
f4 = compass2(fid4);
f5 = compass2(fid5);
range = max([size(f1,2) size(f2,2) size(f3,2) size(f4,2) size(f5,2)]);
f1(:,size(f1,2):range)=0;
f2(:,size(f2,2):range)=0;
f3(:,size(f3,2):range)=0;
f4(:,size(f4,2):range)=0;
f5(:,size(f5,2):range)=0;
trainingDatax=[];
testDatax = [];
trainingDatay = [];
testDatay = [];
[trainingDatax,testDatax,trainingDatay,testDatay] = data(f1,f2,f3,f4,f5);



save('a2data5','trainingDatax','trainingDatay','testDatax','testDatay');