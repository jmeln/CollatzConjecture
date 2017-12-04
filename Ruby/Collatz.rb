#!/usr/bin/env ruby
#Author: Jarrett Melnick
#Program to print numbers with the smallest Collatz values in a given range.
class CollatzNumber
	def initialize(identity, sequence)
		@identity, @sequence = identity, sequence
	end
	def GetIdentity
		@identity
	end
	def GetSequence
		@sequence
	end
end
def Collatz(num = 1)
	#Function to perform the collatz sequence on a given number
	seq = 0
	until num < 2 		#Essentially while(!true). Will run until the condition is met
		num = (num.to_s(2)[-1] == '0') ? (num/2) : (3*num+1)
		seq += 1
	end
	return seq
end
def GetLargest(numArray)
	#Returns the index of the number with the largest collatz sequence
	max = 0
	numArray.each_index{|i|
		if numArray[i] != nil
			if numArray[max].GetSequence < numArray[i].GetSequence
				max = i
			end
		end
	}
	return max
end
def GetSmallest(numArray)
	#Returns the index of the number wiht the smallest collatz sequence
	min = 0;
	numArray.each_index{|i|
		if numArray[i] != nil
			if numArray[min].GetSequence > numArray[i].GetSequence
				min = i
			end
		end
	}
	return min
end
def HasCollatzNumber(numArray, val)
	#Checks if the array contains val. Returns true if val is found.
	numArray.each_index{|i|
		if numArray[i] != nil
			if numArray[i].GetSequence == val
				return true
			end
		end
	}
	return false
end

print "Please provide an endpoint: "
iterate = gets.to_i			#The largest number to be considered. Changes range of numbers iterated.

nums = Array.new(10, CollatzNumber.new(0,0))

puts "Calculating Collatz Values..."
for i in 2..iterate
	smallest = GetSmallest(nums)
	curCollatz = Collatz(i)
	if((curCollatz > nums[smallest].GetSequence) and !(HasCollatzNumber(nums, curCollatz)))
		num = CollatzNumber.new(i, curCollatz)
		nums[smallest] = num
	end
end
puts "Building Table..."
#Prints top 10 numbers with the largest collatz sequence.
for i in 1..10
	largest = GetLargest(nums)
	puts "#{nums[largest].GetIdentity} has a collaz sequence of #{nums[largest].GetSequence}"
	nums[largest] = CollatzNumber.new(0,0)
end