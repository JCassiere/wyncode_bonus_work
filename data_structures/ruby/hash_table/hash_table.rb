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
    @table_length = @table.length
  end

  def hash_key(key)
    key.hash % @table_length
  end

  def get_bucket(key)
    @table[hash_key(key)]
  end

  def get_node(key)
    current_node = get_bucket(key).head
    while current_node
      if current_node.data[0] == key
        return current_node
      end
      current_node = current_node.next_node
    end
    nil
  end

  def insert(key, value)
    #don't check to see if @keys.include?(key)
    #that would make this O(n) time instead of O(1)
    node = get_node(key)
    if node
      node.data[1] = value
    else
      get_bucket(key).push([key, value])
      @keys << key
    end
  end

  def search(key)
    node = get_node(key)
    node ? node.data[1] : nil
  end

  def delete(key)
    get_bucket(key).delete(get_node(key).data)
    @keys.delete(key)
  end
end

