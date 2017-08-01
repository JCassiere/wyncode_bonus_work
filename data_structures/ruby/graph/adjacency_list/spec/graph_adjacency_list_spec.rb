require './graph_adjacency_list.rb'

describe AdjacencyList do

	before(:each) do
		@cincinnati = Node.new("Cincinnati")
		@nashville = Node.new("Nashville")
		@miami = Node.new("Miami")
		@usa = AdjacencyList.new([@cincinnati, @nashville])
	end

	context "node object created" do
		it "is created with a value" do
			expect(@cincinnati).to be_a(Node)
		end

		it "has no neighbors" do
			expect(@cincinnati.neighbors).to eq([])
		end
	end

	context "graph object created" do
		it "has nodes" do
			expect(@usa.nodes).to eq([@cincinnati, @nashville])
		end

		it "can get a node's value" do
			expect(@usa.get_node_value(@cincinnati)).to eq("Cincinnati")
		end

	end

	context "adding a node" do
		it "can add a node" do
			@usa.add_node(@miami)
			expect(@usa.nodes).to eq([@cincinnati, @nashville, @miami])
		end

		it "doesn't add an existing node" do
			@usa.add_node(@cincinnati)
			expect(@usa.nodes).to eq([@cincinnati, @nashville])
		end
	end

	context "removing a node" do
		it "can remove a node" do
			@usa.remove_node(@cincinnati)
			expect(@usa.nodes).to eq([@nashville])
		end

		it "won't raise an error when trying to remove a non-existent node" do
			@usa.remove_node(Node.new("Denver"))
		end
	end

	context "adding a bidirectional edge" do

		before (:each) do
			@usa.add_edge(@cincinnati, @nashville, 300)
			@usa.add_node(@miami)
		end
		
		it "successfully adds an edge" do
			expect(@usa.edges.length).to eq(2)
		end

		it "can check if two nodes are adjacent" do
			expect(@usa.adjacent(@cincinnati, @nashville)).to eq(true)
			expect(@usa.adjacent(@cincinnati, @miami)).to eq(false)
		end

		it "can retrieve all nodes a specific node is connected to" do
			expect(@usa.neighbors(@cincinnati)).to eq([@nashville])
		end		

		it "can add an edge with a weight" do
			expect(@usa.get_edge_weight(@cincinnati, @nashville)).to eq(300)
		end

  context "adding a directed edge"
		it "successfully adds a directed edge" do
			@usa.add_edge(@cincinnati, @nashville, 300)
			@usa.add_node(@miami)
			@usa.add_edge(@cincinnati, @miami, 1500, true)
			expect(@usa.edges[-1].dir).to eq(true)
		end
	end

	context "removing an edge" do

		before (:each) do
			@usa.add_edge(@cincinnati, @nashville, 300)
			@usa.add_node(@miami)
			@usa.add_edge(@cincinnati, @miami, 1500, true)
		end

		it "successfully removes a bidirectional edge" do
			@usa.remove_edge(@cincinnati, @nashville)
			expect(@usa.edges.length).to eq(1)
		end

		it "successfully removes a directed edge" do
			@usa.remove_edge(@cincinnati, @miami)
			expect(@usa.edges.length).to eq(2)
		end

		it "does not remove a directed edge with args given in reverse" do
			@usa.remove_edge(@miami, @cincinnati)
			expect(@usa.edges.length).to eq(3)
		end
	end

	context "setting a node's value" do
		it "can set a node's value" do
			@usa.set_node_value(@cincinnati, "The Queen City")
			expect(@usa.get_node_value(@cincinnati)).to eq("The Queen City")
		end
	end

	context "setting an edge's weight" do
		it "can change an edge's weight" do
			@usa.add_edge(@cincinnati, @nashville, 300)
			@usa.set_edge_weight(@cincinnati, @nashville, 1000)
			expect(@usa.get_edge_weight(@cincinnati, @nashville)).to eq(1000)
		end
	end

end