class AdjacencyList {
  constructor(nodeList) {
    var nodeList = nodeList || [];
    this.nodes = {};
    for (var i = 0; i < nodeList.length; i++) {
      this.nodes[nodeList[i]] = [];
    }
  }

  neighbors(nodeName) {
    return(this.nodes[nodeName]);
  }

  isAdjacent(nodeOne, nodeTwo) {
    return this.neighbors(nodeOne).includes(nodeTwo);
  }

  getNodes() {
    return(Object.keys(this.nodes));
  }

  addNode(nodeName) {
    if (!this.getNodes().includes(nodeName)) {
      this.nodes[nodeName] = [];
    }
  }

  removeNode(nodeName) {
    delete this.nodes[nodeName];
  }

  addEdge(nodeOne, nodeTwo) {
    if (!this.neighbors(nodeOne).includes(nodeTwo)) {
      this.nodes[nodeOne].push(nodeTwo);
      this.nodes[nodeTwo].push(nodeOne);
    }
  }

  removeEdge(nodeOne, nodeTwo) {
    var indexToRemove = this.nodes[nodeOne].indexOf(nodeTwo);
    this.removeAtIndex(this.nodes[nodeOne],indexToRemove);
    var indexToRemove = this.nodes[nodeTwo].indexOf(nodeOne);
    this.removeAtIndex(this.nodes[nodeTwo],indexToRemove);
  }

  removeAtIndex(arr, index) {
    if (index > -1) {
      arr.splice(index, 1);
    }
  }

}

module.exports = AdjacencyList;
