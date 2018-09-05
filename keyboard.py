from __future__ import print_function
import csv
import matplotlib.pyplot as plt
acceTime=[]
acceX=[]
acceY=[]
acceZ=[]

csv_reader = csv.reader(open('C:\\users\\liad1\\Desktop\\Myo Keyboard Data\\Right\\accelerometer-1456704146.csv', encoding='utf-8'))
for row in csv_reader:
    acceTime.append(row[0])
    acceX.append(row[1])
    acceY.append(row[2])
    acceZ.append(row[3])
del acceTime[0]
del acceX[0]
del acceY[0]
del acceZ[0]
#plt.plot(acceTime,acceX,label='X')
plt.plot(acceTime,acceY,label='Y')
#plt.plot(acceTime,acceZ,label='Z')
plt.show()