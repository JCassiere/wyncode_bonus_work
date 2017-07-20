def binary_search(array, num, start_pos=0)
  #returns the index of num in array
  #or -1 if num is not in array
  mid_point = (array.length-1)/2
  if num == array[mid_point]
    start_pos + mid_point
  elsif array.length == 1
    -1
  elsif num < array[mid_point]
    binary_search(array[0..mid_point], num, start_pos)
  else
    binary_search(array[(mid_point + 1)..-1], num, start_pos + mid_point + 1)
  end
end

puts binary_search([1,3,5,6,8,33,345,567,678,789], 789) == 9
puts binary_search([1,3,5,6,8,33,345,567,678,789], 678) == 8
puts binary_search([1,3,5,6,8,33,345,567,678,789], 3) == 1
puts binary_search([1,3,5,6,8,33,345,567,678,789], 1) == 0
puts binary_search([1,3,5,6,8,33,345,567,678,789], 8) == 4
puts binary_search([1,3,5,6,8,33,345,567,678,789], 10) == -1
puts binary_search([1,3,5,6,8,33,345,567,678,789], 40) == -1
puts binary_search([1,3,5,6,8,33,345,567,678,789], 0) == -1
puts binary_search([1,3,5,6,8,33,345,567,678,789], 1000) == -1