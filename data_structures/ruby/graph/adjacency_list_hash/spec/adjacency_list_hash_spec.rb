require './adjacency_list_hash.rb'

describe AdjacencyListHash do

  before(:each) do
    @usa = AdjacencyListHash.new("cincinnati", "nashville")
  end

  context "graph object created" do
    it "has nodes" do
      expect(@usa.nodes).to eq(["cincinnati", "nashville"])
    end
  end

  context "adding a node" do
    it "can add a node" do
      @usa.add_node("miami")
      expect(@usa.nodes).to eq(["cincinnati", "nashville", "miami"])
    end

    it "doesn't add an existing node" do
      @usa.add_node("cincinnati")
      expect(@usa.nodes).to eq(["cincinnati", "nashville"])
    end
  end

  context "removing a node" do
    it "can remove a node" do
      @usa.remove_node("cincinnati")
      expect(@usa.nodes).to eq(["nashville"])
    end

    it "won't raise an error when trying to remove a non-existent node" do
      @usa.remove_node("Denver")
    end
  end

  context "adding a bidirectional edge" do
    before (:each) do
      @usa.add_edge("cincinnati", "nashville")
      @usa.add_node("miami")
    end
    
    it "can check if two nodes are adjacent" do
      expect(@usa.adjacent?("cincinnati", "nashville")).to eq(true)
      expect(@usa.adjacent?("cincinnati", "miami")).to eq(false)
    end

    it "can retrieve all nodes a specific node is connected to" do
      expect(@usa.neighbors("cincinnati")).to eq(["nashville"])
    end    
  end

  context "removing an edge" do
    before (:each) do
      @usa.add_edge("cincinnati", "nashville")
    end

    it "successfully removes a bidirectional edge" do
      @usa.remove_edge("cincinnati", "nashville")
      expect(@usa.neighbors("nashville")).to eq([])
    end
  end
  
end