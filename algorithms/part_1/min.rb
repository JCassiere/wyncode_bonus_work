#*********Min of array big O analysis************
#The while loop traverses each element of the array
#exactly once, and executes a constant number of 
#operations per element.  Thus this algorithm runs 
#in O(c*n) time, where c is some constant and n is the
#number of elements in the array.  This simplifies to 
#O(n) time

def min(arr)
	min_num = arr[0]
	i = 1
	while i < arr.length
		if arr[i] < min_num
			min_num = arr[i]
		end
		i += 1
	end
	min_num
end

puts min([9, 243, -1, 24, 1]) == -1 &&
     min([9, 243, 0, 24, 1]) == 0 &&
     min([9, 243, 10, 24, 1]) == 1