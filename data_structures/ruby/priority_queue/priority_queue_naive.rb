class NaivePriorityQueue

	def initialize(values = [])
		@priority_queue = values
	end

	def insert_with_priority(value)
		@priority_queue << value
	end

	def get_highest_priority
		@priority_queue.delete(@priority_queue.max)
	end

	def peek_highest_priority
		@priority_queue.max
	end

end