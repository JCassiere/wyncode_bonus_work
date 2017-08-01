require './graph_adjacency_matrix.rb'

describe AdjacencyMatrix do

  before(:each) do
    @graph = AdjacencyMatrix.new(6)
  end

  context "graph object created" do
    it "is a matrix" do
      expect(@graph.matrix).to eq([[0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0]])
    end
  end

  context "adding a vertex" do
    it "can add a vertex" do
      @graph.add_vertex()
      expect(@graph.matrix).to eq([[0, 0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0, 0]])
      expect(@graph.num_vertexes).to eq(7)
    end
  end

  context "removing a vertex" do
    it "can remove a vertex" do
      @graph.remove_vertex()
      expect(@graph.matrix).to eq([[0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0]])
      expect(@graph.num_vertexes).to eq(5)
    end

  end

  context "adding a bidirectional edge" do

    before (:each) do
      @graph.add_edge(3, 5)
    end
    
    it "successfully adds an edge" do
      expect(@graph.matrix).to eq([[0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 1],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 1, 0, 0]])
    end

    it "can check if two nodes are adjacent" do
      expect(@graph.adjacent?(3, 5)).to eq(true)
      expect(@graph.adjacent?(3, 4)).to eq(false)
    end

    it "can retrieve all nodes a specific node is connected to" do
      expect(@graph.neighbors(3)).to eq([5])
    end    
  end

  
  context "removing a node based on its location" do
    it "can remove a vertex based on its location" do
      @graph.add_edge(3, 5)
      @graph.add_edge(2, 3)
      @graph.remove_vertex(2)
      expect(@graph.matrix).to eq([[0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 1],
                                   [0, 0, 0, 0, 0],
                                   [0, 0, 1, 0, 0]])
    end
  end

  context "adding a directed edge" do
    it "successfully adds a directed edge" do
      @graph.add_edge(3, 5, true)
      expect(@graph.matrix).to eq([[0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 1, 0, 0]])    
    end
  end

  context "removing an edge" do

    before (:each) do
      @graph.add_edge(3, 5)
      @graph.add_edge(2, 1, true)
    end

    it "successfully removes a bidirectional edge" do
      @graph.remove_edge(3, 5)
      expect(@graph.matrix).to eq([[0, 0, 0, 0, 0, 0],
                                   [0, 0, 1, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0]])
    end

    it "successfully removes a directed edge" do
      @graph.remove_edge(2, 1, true)
      expect(@graph.matrix).to eq([[0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 1],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 1, 0, 0]])
    end

    it "does not remove a directed edge with args given in reverse" do
      @graph.remove_edge(1, 2, true)
      expect(@graph.matrix).to eq([[0, 0, 0, 0, 0, 0],
                                   [0, 0, 1, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 0, 0, 1],
                                   [0, 0, 0, 0, 0, 0],
                                   [0, 0, 0, 1, 0, 0]])
    end
  end

end