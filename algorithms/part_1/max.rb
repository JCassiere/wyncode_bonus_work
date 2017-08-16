#*********Max of array big O analysis************
#The while loop traverses each element of the array
#exactly once, and executes a constant number of 
#operations per element.  Thus this algorithm runs 
#in O(c*n) time, where c is some constant and n is the
#number of elements in the array.  This simplifies to 
#O(n) time

def max(arr)
	max_num = arr[0]
	i = 1
	while i < arr.length
		if arr[i] > max_num
			max_num = arr[i]
		end
		i += 1
	end
	max_num
end

puts max([9, 243, -1, 24, 1]) == 243 &&
     max([-11, -5, -100, -4, -1]) == -1 &&
     max([9, -10, 10, 24, 0]) == 24