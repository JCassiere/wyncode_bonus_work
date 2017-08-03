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

	def push(next_node_data)
		next_node = Node.new(next_node_data)
		if @head
			@last.next_node = next_node
			@last = next_node
		else
			@head = next_node
			@last = next_node
		end
	end

	def pop
		return_data = @last.data
		@last = self.search(self.traverse(self.length-2))
		@last.next_node = nil
		return_data
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
		insertion_node = self.search(data)
		new_node.next_node = insertion_node.next_node
		insertion_node.next_node = new_node
	end

	def shift(new_head_data)
		new_head = Node.new(new_head_data)
		new_head.next_node = @head
		@head = new_head
	end

	def delete(data)
		current_node = @head
		until current_node.next_node == nil || current_node.next_node.data == data
			current_node = current_node.next_node
		end
		if current_node.next_node
			delete_node = current_node.next_node
			current_node.next_node = delete_node.next_node
			delete_node.next_node = nil
			delete_node.data
		elsif current_node == @head
			@head = nil
			@last = nil
		else
			nil
		end
	end

	def unshift
		unshift_data = @head.data
		@head = @head.next_node
		unless @head
			@last = nil
		end
		unshift_data
	end

	def traverse(index, start_node_data=@head.data)
		node = self.search(start_node_data)
		index == 0 ? node.data : traverse(index-1, node.next_node.data)
	end

end