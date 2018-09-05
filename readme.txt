Special feature 1.
For data separation part, we used Matlab and followed steps as following,
1. findpeak() which finds all peaks required for raw data
	A threshold(mean of all data *1.04) is set as minimal height. 
	A minimal distance between steps is set to 30.
	When more than 10 peaks are found, pick the maximum 10 values.
2. find the leftbound and rightbound of each step for each peak.
	leftbound = peak index -10, rightbound = peak index+10.
	Calulating new thresholds=0.5*(peak-mean)+mean for each peak, where 0.5 is an coefficient that can be changed and tested.
	To increse the robustness of this algorithm, for each bound, maximum of values in current and previous four position is found. Comparing the value with the new threshold, if the 	value is less than the new threshold then keep moving the bound, otherwise stop moving and return the bound.

Special feature 2.
In 4.1 & 4.2, for each key, we randomly choose a step as our testing set. Also we shuffled the training data to avoid our model learning sequence of training set. The accuracy is found by testing five data together, divide the number of correct guess by 5 to get the accuracy. Say four keys are recognized correctly, then 4/5=0.8 is our accuracy of this trial.