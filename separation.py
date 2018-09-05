import csv
def separate(fileName, threshold, value,interval,amount):
    result =[]
    temp = []
    time = []
    dataX = []
    datas = []
    datasindex = []
    backwardpoints = []
    csv_reader = csv.reader(
        open("C:\\users\\liad1\\Desktop\\Myo Keyboard Data\\"+fileName, encoding='utf-8'))
    for row in csv_reader:
        time.append(row[0])
        dataX.append(row[value])
    del time[0]
    del dataX[0]
    for i in range(0,len(dataX)):
        if(float(dataX[i])>=threshold):
            temp.append(i)

    datas.append(dataX[temp[0]])
    datasindex.append(temp[0])
    for j in range(0,len(temp)-1):

        if(float(temp[j+1])-float(temp[j])<interval):
            datas.append(dataX[temp[j+1]])
            datasindex.append(temp[j+1])

        else:
            min_value = min(datas)
            min_index = datas.index(min_value)
            result.append(datasindex[min_index]+2)
            datas = []
            datasindex = []
            datas.append(dataX[temp[j+1]])
            datasindex.append(temp[j+1])

    for m in range(0, len(result)):
        backwardpoints.append(result[m] - int(amount/2))
        backwardpoints.append(result[m] + int(amount/2))
    return backwardpoints

#40 data for one interval
backwardpoints = separate("Backward\\accelerometer-1456704054.csv", -0.65,2,15,40 )
enterpoints = separate("Enter\\accelerometer-1456704184.csv", -0.7,2,15,40 )
forwardpoints = separate("Forward\\accelerometer-1456703940.csv", -0.55,2,15,40 )
leftpoints = separate("Left\\accelerometer-1456704106.csv", -0.64,2,15,40 )
rightpoints = separate("Right\\accelerometer-1456704146.csv", -0.64,2,12,40 )


