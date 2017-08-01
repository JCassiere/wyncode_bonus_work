class Stack

	def initialize()
		@stack = []
	end

	def push(element)
		@stack << (element)
	end

	def pop()
		@stack.pop()
	end

	def peek()
		@stack[-1]
	end

end