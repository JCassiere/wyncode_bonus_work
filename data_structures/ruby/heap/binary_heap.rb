class MaxHeap
  attr_reader :heap

  def initialize(node_values=[])
    @next_index = 0
    @heap = []
    unless node_values.empty?
      @heap << node_values[0]
      @next_index += 1
      node_values[1..-1].each do |value|
        insert(value)
      end
    end
  end

  def insert(value)
    current_index = @next_index
    @heap[current_index] = value
    parent_index = get_parent_index(current_index)
    parent_value = @heap[parent_index]
    until value <= parent_value || current_index == 0
      @heap[current_index] = parent_value
      @heap[parent_index] = value
      current_index = parent_index
      parent_index = get_parent_index(current_index)
      parent_value = @heap[parent_index]
    end
    @next_index += 1
  end

  def extract
    prev_root = @heap[0]
    @heap[0] = @heap.pop
    current_index = 0
    children = get_children(current_index)

    until children[0].nil? || @heap[current_index] > children.max
      if children[0] == children.max
        switch_index = get_child_indices(current_index)[0]
        switch_value = children[0]
      else
        switch_index = get_child_indices(current_index)[1]
        switch_value = children[1]
      end
      @heap[switch_index] = @heap[current_index]
      @heap[current_index] = switch_value
      current_index = switch_index
      children = get_children(current_index)
    end
    prev_root
  end

  def peek
    @heap[0]
  end


  private

  def get_parent_index(child_index)
    ((child_index-1)/2).floor
  end

  def get_child_indices(parent_index)
    [(2*parent_index+1), (2*parent_index+2)]
  end

  def get_children(parent_index)
    children = get_child_indices(parent_index).map do |ind|
      @heap[ind]
    end
    children
  end
end

max_heap = MaxHeap.new([4, 11, 2, 8, 47, 9, 1, 1234, 10, 123])
val = max_heap.extract
p max_heap.heap


class MinHeap < MaxHeap

  def initialize(node_values = [])
    super
  end

  def insert(value)
    current_index = @next_index
    @heap[current_index] = value
    parent_index = get_parent_index(current_index)
    parent_value = @heap[parent_index]
    until value >= parent_value || current_index == 0
      @heap[current_index] = parent_value
      @heap[parent_index] = value
      current_index = parent_index
      parent_index = get_parent_index(current_index)
      parent_value = @heap[parent_index]
    end
    @next_index += 1
  end

  def extract
    prev_root = @heap[0]
    @heap[0] = @heap.pop
    current_index = 0
    children = get_children(current_index)

    until children[0].nil? || @heap[current_index] < children.min
      if children[0] == children.min
        switch_index = get_child_indices(current_index)[0]
        switch_value = children[0]
      else
        switch_index = get_child_indices(current_index)[1]
        switch_value = children[1]
      end
      @heap[switch_index] = @heap[current_index]
      @heap[current_index] = switch_value
      current_index = switch_index
      children = get_children(current_index)
    end
    prev_root
  end

end