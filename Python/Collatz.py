#!/usr/bin/python
#Author: Jarrett Melnick
#Program to calculate the top 10 largest Collatz values for a given range.
def Collatz(num, N):
	#Function to calculate the length the Collatz sequence for the given number.
	seq = 0
	while(num > 1):
		if(N.has_key(num)):
			return seq + N[num]

		n = bin(num)
		if(n[-1] == '1'):
			num = 3*num+1
			num = num/2
			seq = seq + 2
		else:
			num = num/2
			seq = seq + 1

	return seq

def GetLargest(N):
	#Gets the largest number in the dictionary table 
	maxi = 1
	for i in N.keys():
		if(N[i] >= N[maxi]):
			maxi = i

	return maxi

Nums = {}		#Dictionary to store Collatz Values of the index.
Nums[1] = 1		
print "Please provide an endpoint"
iterate = int(input())
for i in range(1, iterate):
	Nums[i] = Collatz(i, Nums)
	
for i in range(0,10):
#Prints the numbers with the top 10 largest Collatz values
	if(len(Nums) > 0):
		largest = GetLargest(Nums)
		print "%d has a collatz sequence of length %d" % (largest, Nums[largest])
		del Nums[largest]
