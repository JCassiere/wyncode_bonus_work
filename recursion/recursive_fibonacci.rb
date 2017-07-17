memo = {0 => 0, 1 => 1}
def fibonacci(i, memo)
	if memo.include?(i)
		memo[i]
	else
		memo[i] = fibonacci(i-1, memo) + fibonacci(i-2, memo)
	end
end

puts fibonacci(3, memo)
puts fibonacci(4, memo)
puts fibonacci(5, memo)
puts fibonacci(6, memo)
puts fibonacci(7, memo)
puts fibonacci(8, memo)
puts fibonacci(9, memo)
puts fibonacci(10, memo)
