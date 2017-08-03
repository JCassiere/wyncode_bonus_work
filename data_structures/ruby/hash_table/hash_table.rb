require '../linked_list/linked_list.rb'

class HashTable
	attr_reader :table, :keys

	def initialize(num_buckets_power = 8)
		#num_buckets should be a power of 2
		@table = []
		@keys = []
		(2**num_buckets_power).times do |num|
			@table << LinkedList.new()
		end
	end

	def hash_key(key)
		key.hash % @table.length
	end

	def get_bucket(key)
		@table[hash_key(key)]
	end

	def insert(key, value)
		#don't check to see if @keys.include?(key)
		#that would make this O(n) time instead of O(1)
		bucket = get_bucket(key)
		key_exists = false
		current_node = bucket.head
		if bucket.head
			until key_exists || current_node == nil
				if current_node.data[0] == key
					key_exists = true
					current_node.data[1] = value
				else
					current_node = current_node.next_node
				end
			end
		end
		unless key_exists
			bucket.push([key, value])
			add_key(key)
		end
	end

	def search(key)
		current_node = get_bucket(key).head
		while current_node
			if current_node.data[0] == key
				break
			end
			current_node = current_node.next_node
		end
		current_node ? current_node.data[1] : nil
	end

	def delete(key)
		bucket = get_bucket(key)
		current_node = bucket.head
		while current_node
			if current_node.data[0] == key
				bucket.delete(current_node.data)
				delete_key(key)
				break
			end
			current_node = current_node.next_node
		end
	end

	private

	def add_key(key)
		@keys << key
	end

	def delete_key(key)
		@keys.delete(key)
	end

end

