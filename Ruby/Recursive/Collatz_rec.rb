#!/usr/bin/env ruby

def Collatz(num = 1, numArray, seq)
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

iterate = 13

nums = [0, 1, 1]
for i in 3..iterate do 
	nums[i] = Collatz(i, nums, 0)
end
for i in 1..10 do
	largest = GetLargest(nums)
	puts "#{largest} has a collaz sequence of #{nums[largest]}"
	nums[largest] = nil
end		