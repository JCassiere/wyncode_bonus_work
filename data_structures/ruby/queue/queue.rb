class Queue

	def initialize()
		@queue = []
	end

	def enqueue(element)
		@queue << (element)
	end

	def dequeue()
		@queue.shift
	end

end