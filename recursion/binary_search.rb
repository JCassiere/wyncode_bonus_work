def binary_search(array, num_to_find)
  #returns the index of num_to_find in array
  #or a string saying that num_to_find is not in the array
  check_index = array.length/2 - 1
  element = array[check_index]
  if num_to_find == element
    check_index
  elsif array.length == 1
    "The given number is not in the array"
  elsif num_to_find < element
    binary_search(array[0..check_index], num_to_find)
  else
    begin
      check_index + 1 + binary_search(array[(check_index + 1)..-1], num_to_find)
    rescue TypeError
      "The given number is not in the array"
    end
  end
end

puts binary_search([1,3,5,6,8,33,345,567,678,789], 678)
puts binary_search([1,3,5,6,8,33,345,567,678,789], 3)
puts binary_search([1,3,5,6,8,33,345,567,678,789], 1)
puts binary_search([1,3,5,6,8,33,345,567,678,789], 8)
puts binary_search([1,3,5,6,8,33,345,567,678,789], 10)