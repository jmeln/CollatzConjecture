#!/usr/bin/env ruby
#Author: Jarrett Melnick
#Program to print numbers with the smallest Collatz values.
def Collatz(num = 1, numArray, seq)
	#Function to perform the collatz sequence on a given number
	#numArray has the collatz values of the previous iterations to improve runtime.
	if numArray[num] != nil
		return seq + numArray[num]
	elsif num < 2
		return seq +1
	else
		seq += 1
		return (num.to_s(2)[-1] == '0') ? Collatz((num/2), numArray, seq) : Collatz((3*num+1), numArray, seq)
	end
end
def GetLargest(numArray)
	#Returns the index of the number with the largest collatz sequence
	max = 0
	numArray.each_index{|i|
		if numArray[i] != nil
			if numArray[max] < numArray[i]
				max = i
			end
		end
	}
	return max
end

iterate = 13			#The largest value to check.
	
nums = [0, 1, 1]
for i in 3..iterate do 
	nums[i] = Collatz(i, nums, 0)
end

#Prints the top 10 numbers with the largest Collatz sequence
for i in 1..10 do
	largest = GetLargest(nums)
	puts "#{largest} has a collaz sequence of #{nums[largest]}"
	nums[largest] = nil
end		