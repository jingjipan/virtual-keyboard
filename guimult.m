close all
clear all
clc
fid1 = 'C:\\Users\\Jingji Pan\\Desktop\\comp4190ass2\\Myo Keyboard Data\\Right\\accelerometer-1456704146.csv';
fid2 = 'C:\\Users\\Jingji Pan\\Desktop\\comp4190ass2\\Myo Keyboard Data\\Backward\\accelerometer-1456704054.csv';
fid3 ='C:\\Users\\Jingji Pan\\Desktop\\comp4190ass2\\Myo Keyboard Data\\Enter\\accelerometer-1456704184.csv';
fid4 = 'C:\\Users\\Jingji Pan\\Desktop\\comp4190ass2\\Myo Keyboard Data\\Forward\\accelerometer-1456703940.csv';
fid5 = 'C:\\Users\\Jingji Pan\\Desktop\\comp4190ass2\\Myo Keyboard Data\\Left\\accelerometer-1456704106.csv';

[f1x, f1y, f1z] = compass2mult(fid1);
[f2x, f2y, f2z] = compass2mult(fid2);
[f3x, f3y, f3z] = compass2mult(fid3);
[f4x, f4y, f4z] = compass2mult(fid4);
[f5x, f5y, f5z] = compass2mult(fid5);


range = max([size(f1x,2) size(f2x,2) size(f3x,2) size(f4x,2) size(f5x,2)]);
f1x(:,size(f1x,2):range)=0;
f1y(:,size(f1y,2):range)=0;
f1z(:,size(f1z,2):range)=0;
f2x(:,size(f2x,2):range)=0;
f2y(:,size(f2y,2):range)=0;
f2z(:,size(f2z,2):range)=0;
f3x(:,size(f3x,2):range)=0;
f3y(:,size(f3y,2):range)=0;
f3z(:,size(f3z,2):range)=0;
f4x(:,size(f4x,2):range)=0;
f4y(:,size(f4y,2):range)=0;
f4z(:,size(f4z,2):range)=0;
f5x(:,size(f5x,2):range)=0;
f5y(:,size(f5y,2):range)=0;
f5z(:,size(f5z,2):range)=0;
f1=[f1x f1y f1z];
f2=[f2x f2y f2z];
f3=[f3x f3y f3z];
f4=[f4x f4y f4z];
f5=[f5x f5y f5z];
trainingDatax=[];
testDatax = [];
trainingDatay = [];
testDatay = [];
[trainingDatax,testDatax,trainingDatay,testDatay] = datamult(f1,f2,f3,f4,f5);




save('a2datamult','trainingDatax','trainingDatay','testDatax','testDatay');