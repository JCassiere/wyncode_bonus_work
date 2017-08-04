class AdjacencyListHash

  def initialize(*node_list)
    #nodes will be an array of Node objects
    @nodes = {}
    node_list.each do |node|
      @nodes[node] = Hash[node_list.map do |inner_node| 
                       [inner_node, false]
                     end
                     ]
    end
  end

  def neighbors(node_name)
    neighbors_array = []
    @nodes[node_name].keys.each do |neighbor_node|
      if @nodes[node_name][neighbor_node]
        neighbors_array << neighbor_node
      end
    end
    neighbors_array
  end

  def adjacent?(node_one, node_two)
    @nodes[node_one][node_two]
  end

  def nodes
    @nodes.keys
  end

  def add_node(node_name)
    unless @nodes.keys.include?(node_name)
      @nodes[node_name] = Hash[@nodes.map do |node| 
                               [node, false]
                          end
                        ]
      @nodes.keys.each do |node|
        @nodes[node][node_name] = false
      end
    end
  end

  def remove_node(node)
    @nodes.delete(node)
  end

  def add_edge(node_one_name, node_two_name)
    @nodes[node_one_name][node_two_name] = true
    @nodes[node_two_name][node_one_name] = true
  end

  def remove_edge(node_one_name, node_two_name)
    @nodes[node_one_name][node_two_name] = false
    @nodes[node_two_name][node_one_name] = false
  end

end