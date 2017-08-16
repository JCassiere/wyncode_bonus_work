#*****Index of element in array big O analysis*********
#The while loop traverses each element of the array
#at most once, and executes a constant number of 
#operations per element.  In a best-case scenario, the
#element is in the 0th index of the array, and the loop
#operations only run on one element.  In a worst-case 
#scenario, the loop operations run on each element in
#the array. Thus this algorithm runs  in O(c*n) time, 
#where c is some constant and n is the number of elements 
#in the array.  This simplifies to O(n) time.

def find_index(arr, el)
	i = 0
	while i < arr.length
		if arr[i] == el
			return i
		end
		i += 1
	end
	nil
end

puts find_index([9, 243, -1, 24, 1], -1) == 2 &&
     find_index([-11, -5, -100, -4, -1], -4) == 3 &&
     find_index([9, -10, 10, 24, 0], 100) == nil