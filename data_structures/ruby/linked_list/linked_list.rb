class Node
	attr_accessor :next_node
	attr_reader :data

	def initialize(data=nil, next_node=nil)
		@data = data
		@next_node = next_node
	end

end

class LinkedList
	attr_reader :head, :last

	def initialize(head_data=nil)
		if head_data
			@head = Node.new(head_data)
		else
			@head = nil
		end
		@last = @head
	end

	def length
		count = 0
		node = @head
		while node
			count += 1
			node = node.next_node
		end
		count
	end

	def add_next(next_node_data)
		next_node = Node.new(next_node_data)
		if @head
			@last.next_node = next_node
			@last = next_node
		else
			@head = next_node
			@last = next_node
		end
	end

	def search(data)
		current_node = @head
		until current_node.data == data || current_node.data == nil
			current_node = current_node.next_node
		end
		current_node
	end

	def insert_after(data, data_to_insert)
		new_node = Node.new(data_to_insert)
		insertion_node = search(data)
		new_node.next_node = insertion_node.next_node
		insertion_node.next_node = new_node
	end

	def insert_head(new_head_data)
		new_head = Node.new(new_head_data)
		new_head.next_node = @head
		@head = new_head
	end

	def delete_after(data)
		node = search(data)
		node.next_node = node.next_node.next_node
	end

	def delete_head
		@head = @head.next_node
		unless @head
			@last = nil
		end
	end

	def traverse(num_steps, start_node_data=@head.data)
		node = search(start_node_data)
		num_steps == 0 ? node.data : traverse(num_steps-1, node.next_node.data)
	end

end