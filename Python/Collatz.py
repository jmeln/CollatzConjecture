#!/usr/bin/python

def Collatz(num, N):
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
	maxi = 1
	for i in N.keys():
		if(N[i] >= N[maxi]):
			maxi = i

	return maxi

Nums = {}
Nums[1] = 1
print "Please provide an endpoint"
iterate = int(input())
for i in range(1, iterate):
	Nums[i] = Collatz(i, Nums)
	
for i in range(0,10):
	if(len(Nums) > 0):
		largest = GetLargest(Nums)
		print "%d has a collatz sequence of length %d" % (largest, Nums[largest])
		del Nums[largest]
