describe("AdjacencyList", function() {
  var AdjacencyList = require("../AdjacencyList");
  var usa;

  beforeEach(function() {
    usa = new AdjacencyList(["cincinnati", "nashville"]);
  });

  describe("graph object created", function() {
    it("has nodes", function() {
      expect(usa.getNodes()).toEqual(["cincinnati", "nashville"]);
    });
  });

  describe("adding a node", function() {
    it("can add a node", function() {
      usa.addNode("miami");
      expect(usa.getNodes()).toEqual(["cincinnati", "nashville", "miami"]);
    });

    it("doesn't add an existing node", function() {
      usa.addNode("cincinnati");
      expect(usa.getNodes()).toEqual(["cincinnati", "nashville"]);
    });
  });

  describe("removing a node", function() {
    it("can remove a node", function() {
      usa.removeNode("cincinnati");
      expect(usa.getNodes()).toEqual(["nashville"]);
    });

    it("won't raise an error when trying to remove a non-existent node", function() {
      usa.removeNode("Denver");
    });
  });

  describe("adding a bidirectional edge", function() {
    beforeEach(function() {
      usa.addEdge("cincinnati", "nashville");
      usa.addNode("miami");
    });
    
    it("can check if two nodes are adjacent", function() {
      expect(usa.isAdjacent("cincinnati", "nashville")).toEqual(true);
      expect(usa.isAdjacent("cincinnati", "miami")).toEqual(false);
    });

    it("can retrieve all nodes a specific node is connected to", function() {
      expect(usa.neighbors("cincinnati")).toEqual(["nashville"]);
    });    
  });

  describe("removing an edge", function() {
    beforeEach(function() {
      usa.addEdge("cincinnati", "nashville");
    });

    it("successfully removes a bidirectional edge", function() {
      usa.removeEdge("cincinnati", "nashville");
      expect(usa.neighbors("nashville")).toEqual([]);
    });
  });
  
});