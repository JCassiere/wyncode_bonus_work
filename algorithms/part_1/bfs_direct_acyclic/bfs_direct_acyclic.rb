#****BFS through Direct Acyclic Graph Big O Analysis****
#This algorithm loops through each

require './directed_graph.rb'

def bfs_direct_acyclic(graph, source)
	distances = { source => {distance: 0, predecessor: nil} }
	visited = Queue.new
	visited.enq(source)
	until visited.empty?
		current = visited.deq
		graph.neighbors(current).each do |neighbor|
			unless distances[neighbor]
				distances[neighbor] = {
					                      distance: distances[current][:distance] + 1, 
					                      predecessor: current
					                    }
				visited.enq(neighbor)
			end
		end
	end
	distances
end

test_graph = DirectedGraph.new(1, 2, 3, 4, 5, 6)
test_graph.add_edge(1, 2)
test_graph.add_edge(1, 4)
test_graph.add_edge(2, 3)
test_graph.add_edge(2, 4)
test_graph.add_edge(4, 6)
test_graph.add_edge(6, 5)

distances = bfs_direct_acyclic(test_graph, 1)
puts distances[5][:distance] == 3 &&
     distances[2][:distance] == 1 &&
     distances[4][:distance] == 1