#!/usr/bin/python
#Author: Jarrett Melnick
#Program to calculate the top 10 largest Collatz values for a given range.
class CollatzNumber:
	def __init__(self, identity,sequence):
		self.identity = long(identity)
		self.sequence = long(sequence)

def Collatz(num):
	#Function to calculate the length the Collatz sequence for the given number.
	seq = 0
	while(num > 1):
		n = bin(num)
		if(n[-1] == '1'):
			num = 3*num+1
			num = num/2
			seq = seq + 2
		else:
			num = num/2
			seq = seq + 1

	return seq

def GetLargest(N,seq):
	#Gets the largest number in the dictionary table 
	maxi = 1
	if(seq == 1):
		for i in range(0,10):
			if(N[i].sequence >= N[maxi].sequence):
				maxi = i
		return maxi
	else:
		for i in range(0,10):
			if(N[i].identity >= N[maxi].identity):
				maxi = i
		return maxi

def GetSmallest(N):
	#num = CollatzNumber(0,-1)
	#N.append(num)
	mini = 0
	for i in range(1,10):
		if(N[i].sequence < N[mini].sequence):
			mini = i
	#N.pop(10)
	#print "%d has the smallest collatz sequence of length %d" % (Nums[mini].identity, Nums[mini].sequence)
	return mini

def hasCollatzNumber(N, val):
	for i in range(0,10):
		if(N[i].sequence == val):
			return True
	return False

Nums = []		#List to store Collatz Values of the index.
for i in range(0, 10):
	num = CollatzNumber(0, 0)
	Nums.insert(0,num)

print "Please provide an endpoint"
iterate = long(input())
print "CALCULATING VALUES..."
for i in xrange(2, iterate+1):
	curCollatz = Collatz(i)
	smallest = GetSmallest(Nums)
	if((curCollatz > Nums[smallest].sequence) and not(hasCollatzNumber(Nums,curCollatz))):
		num = CollatzNumber(i, curCollatz)
		Nums[smallest] = num
		#print len(Nums)
	
print "SORTED BY SEQUENCE LENGTH:"
Nums2 = list(Nums)
for i in range(0,10):
#Prints the numbers with the top 10 largest Collatz values
	largest = GetLargest(Nums,1)
  	print "%d has a collatz sequence of length %d" % (Nums[largest].identity, Nums[largest].sequence)
  	num = CollatzNumber(0,0)
  	Nums[largest] = num

print "\nSORTED BY INTEGER LENGTH:"
for i in range(0,10):
	largest = GetLargest(Nums2,0)
	print "%d has a collatz sequene of length %d" % (Nums2[largest].identity, Nums2[largest].sequence)
	num = CollatzNumber(0,0)
	Nums2[largest] = num
