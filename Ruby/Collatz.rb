#!/usr/bin/env ruby

def Collatz(num = 1, numArray)
	seq = 0
	until num < 2
		if numArray[num] != nil
			seq = seq + numArray[num]
			break
		else
			#seq = (num.to_s(2)[-1] == '0') ? (seq + 1) : (seq + 2)
			num = (num.to_s(2)[-1] == '0') ? (num/2) : (3*num+1)
			seq += 1
		end
	end
	return seq
end
def GetLargest(numArray)
	max = 0
	numArray.each_index{|i|
		if numArray[i] != nil
			if numArray[max]  <= numArray[i]
				max = i
			end
		end
	}
	return max
end

iterate = 13

nums = [0, 1, 1]
for i in 3..iterate do 
	nums[i] = Collatz(i, nums)
end
for i in 1..10 do
	largest = GetLargest(nums)
	puts "#{largest} has a collaz sequence of #{nums[largest]}"
	nums[largest] = nil
end		