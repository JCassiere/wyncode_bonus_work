#*****Selection Sort Big O Analysis********
#This algorithm runs a constant set of operations 
#on each element of an array once, and then for each
#element, it runs a constant set of operations on an
#average of (n/2) elements.  Combining and dropping
#constant factors, this algorithm runs in O(n^2) time

def selection_sort(arr)
	i = 0
	while i < arr.length
		next_num = arr[i]
		j = i
		while j < arr.length
			if arr[j] < arr[i]
				arr = swap(arr, i, j)
			end
			j += 1
		end
		i += 1
	end
	arr
end

def swap(arr, index_1, index_2)
	arr[index_1], arr[index_2] = arr[index_2], arr[index_1]
	arr
end

puts swap([1, 5, 7], 0, 2)

puts selection_sort([5, 7, 2, 5, 1, 9, 10, 0]) == [0, 1, 2, 5, 5, 7, 9, 10]