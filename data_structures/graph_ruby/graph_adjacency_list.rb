class Node
  attr_accessor :value
  attr_reader :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
    @edges = []
  end

  def add_edge(edge, node)
    unless @edges.include?(edge)
      @edges << edge
      @neighbors << node
    end
  end

  def remove_neighbor(node)
    @neighbors.delete(node)
    node.neighbors.delete(self)
  end

  def to_s
    @value
  end

end

class Edge
  attr_accessor :start_node, :end_node, :weight, :dir

  def initialize(start_node, end_node, weight=0, dir=false)
    @start_node = start_node
    @end_node = end_node
    @weight = weight
    #bidirectional if false
    #directed from start_node to end_node if true
    @dir = dir
    @start_node.add_edge(self, end_node)
    @end_node.add_edge(self, start_node)
  end

  def to_s
    "#{@start_node} => #{@end_node}"
  end

end

class AdjacencyList
  attr_reader :nodes, :edges

  def initialize(nodes)
    #nodes will be an array of Node objects
    @nodes = nodes
    @edges = []
  end

  def adjacent(node_one, node_two)
    node_one.neighbors.include?(node_two)
  end

  def neighbors(node)
    node.neighbors
  end

  def add_node(node)
    unless @nodes.include?(node)
      @nodes << node
    end
  end

  def remove_node(node)
    @nodes.delete(node)
  end

  def check_for_edge(node_one, node_two)
    edge_nodes = [node_one, node_two]
    @edges.each do |edge|
      if edge_nodes.include?(edge.start_node) && edge_nodes.include?(edge.end_node)
        return edge
      end
    end
    false
  end

  def add_edge(node_one, node_two, weight=0, dir=false)
    unless check_for_edge(node_one, node_two)
      @edges << Edge.new(node_one, node_two, weight, dir)
    end
  end

  def remove_edge(node_one, node_two)
  	edge = check_for_edge(node_one, node_two)
  	if edge
	  	@edges.delete(edge)
	  	node_one.remove_neighbor(node_two)
	  end
  end

  def get_node_value(node)
  	node.value
  end

  def set_node_value(node, value)
  	node.value = value
  end

  def get_edge_weight(node_one, node_two)
  	edge = check_for_edge(node_one, node_two)
  	if edge
  		edge.weight
  	end
  end

  def set_edge_weight(node_one, node_two, weight)
  	edge = check_for_edge(node_one, node_two)
  	if edge
  		edge.weight = weight
  	end
  end

end