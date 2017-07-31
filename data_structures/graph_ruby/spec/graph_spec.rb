require './graph.rb'

describe Graph do

	let(:cincinnati) do
		Node.new("Cincinnati")
	end

	context "node object created" do
		it "is created with a value" do
			expect(cincinnati).to be_a(Node)
		end

		it "has no neighbors" do
			expect(cincinnati.neighbors).to eq({})
		end
	end

	let(:nashville) do
		Node.new("Nashville")
	end

	context "neighbor added to node" do
		it "shows the neighbor" do
			cincinnati.add_neighbor(nashville, 300)
			expect(cincinnati.neighbors).to eq({nashville => 300})
			expect(nashville.neighbors).to eq({cincinnati => 300})
		end

		it "can remove the neighbor" do
			cincinnati.add_neighbor(nashville, 300)
			cincinnati.remove_neighbor(nashville)
			expect(cincinnati.neighbors).to eq({})
			expect(nashville.neighbors).to eq({})
		end
	end

	let(:usa) do
		cincinnati.add_neighbor(nashville, 300)
		Graph.new([cincinnati, nashville])
	end

	let(:miami) do
		Node.new("Miami")
	end

	context "graph object created" do
		it "has nodes" do
			expect(usa.nodes).to eq([cincinnati, nashville])
		end

		it "has edges based on its nodes' neighbors" do
			expect(usa.edges.length).to eq(1)
		end

		it "can check if two nodes are adjacent" do
			expect(usa.adjacent(cincinnati, nashville)).to eq(true)
			expect(usa.adjacent(cincinnati, miami)).to eq(false)
		end

		it "can retrieve all nodes a specific node is connected to" do
			expect(usa.neighbors(cincinnati)).to eq([nashville])
		end		

		it "can get a node's value" do
			expect(usa.get_node_value(cincinnati)).to eq("Cincinnati")
		end

		it "can get an edge's weight" do
			expect(usa.get_edge_weight(cincinnati, nashville)).to eq(300)
		end

	end

	context "adding a node" do
		it "can add a node" do
			usa.add_node(miami)
			expect(usa.nodes).to eq([cincinnati, nashville, miami])
		end

		it "doesn't add an existing node" do
			usa.add_node(cincinnati)
			expect(usa.nodes).to eq([cincinnati, nashville])
		end
	end

	context "removing a node" do
		it "can remove a node" do
			usa.remove_node(cincinnati)
			expect(usa.nodes).to eq([nashville])
		end

		it "won't raise an error when trying to remove a non-existent node" do
			usa.remove_node(Node.new("Denver"))
		end
	end

	context "adding an edge" do
		it "successfully adds an edge" do
			usa.add_node(miami)
			usa.add_edge(cincinnati, miami, 1500)
			expect(usa.edges.length).to eq(2)
		end

		it "adds an edge with a weight" do
			usa.add_node(miami)
			usa.add_edge(cincinnati, miami, 1500)
			expect(usa.edges[-1].weight).to eq(1500)
		end

		it "successfully adds a directed edge" do
			usa.add_node(miami)
			usa.add_edge(cincinnati, miami, 1500, true)
			expect(usa.edges[-1].dir).to eq(true)
			expect(miami.neighbors[cincinnati]).to eq(-1500)
		end
	end

	let(:new_usa) do
		cincinnati.add_neighbor(nashville, 500)
		cincinnati.add_neighbor(miami, 1500)
		Graph.new([cincinnati, nashville, miami])
		# new_usa.add_edge(cincinnati, miami, 1500)
	end

	context "removing an edge" do
		it "successfully removes the edge" do
			new_usa.remove_edge(cincinnati, miami)
			expect(new_usa.edges.length).to eq(1)
		end
	end

	context "setting a node's value" do
		it "can set a node's value" do
			new_usa.set_node_value(cincinnati, "The Queen City")
			expect(new_usa.get_node_value(cincinnati)).to eq("The Queen City")
		end
	end

	context "setting an edge's weight" do
		it "can change an edge's weight" do
			new_usa.set_edge_weight(cincinnati, nashville, 1000)
			expect(new_usa.get_edge_weight(cincinnati,nashville)).to eq(1000)
		end
	end

end