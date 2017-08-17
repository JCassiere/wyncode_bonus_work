class AdjacencyListHash

  def initialize(*nodes)
    #nodes will be an array of Node objects
    @nodes = {}
    nodes.each do |node|
      @nodes[node] = []
    end
  end

  def neighbors(node_name)
    @nodes[node_name]
  end

  def adjacent?(node_one, node_two)
    neighbors(node_one).include?(node_two)
  end

  def nodes
    @nodes.keys
  end

  def add_node(node_name)
    unless @nodes.keys.include?(node_name)
      @nodes[node_name] = []
    end
  end

  def remove_node(node)
    @nodes.delete(node)
  end

  def add_edge(node_one_name, node_two_name)
    unless neighbors(node_one_name).include?(node_two_name)
      @nodes[node_one_name] << node_two_name
      @nodes[node_two_name] << node_one_name
    end
  end

  def remove_edge(node_one_name, node_two_name)
    @nodes[node_one_name].delete(node_two_name)
    @nodes[node_two_name].delete(node_one_name)
  end

end