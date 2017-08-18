class BinaryHeap {
  constructor(nodeValues) {
    var nodeValues = nodeValues || [];
    this.nextIndex = 0;
    this.heap = [];
    if (nodeValues.length !== 0) {
      this.heap.push(nodeValues[0]);
      this.nextIndex++;
      var nodeSplice = nodeValues.splice(1, nodeValues.length-1);
      for (var i=0; i < nodeSplice.length; i++) {
        this.insert(nodeSplice[i]);
      }
    }
  }

  insert(value) {
    var currentIndex = this.nextIndex;
    this.heap[currentIndex] = value;
    var parentIndex = this.getParentIndex(currentIndex);
    var parentValue = this.heap[parentIndex];
    while (value > parentValue && currentIndex !== 0) {
      this.heap[currentIndex] = parentValue;
      this.heap[parentIndex] = value;
      currentIndex = parentIndex;
      parentIndex = this.getParentIndex(currentIndex);
      parentValue = this.heap[parentIndex];
    }
    this.nextIndex++;
  }

  extract() {
  	var prevRoot = this.heap[0];
  	this.heap[0] = this.heap.pop();
  	var currentIndex = 0;
  	var children = this.getChildren(currentIndex);
  	var switchIndex;
  	var switchValue;
  	while (children[0] !== null && this.heap[currentIndex] <= Math.max(...children)) {
  		if (children[0] === Math.max(...children)) {
  			switchIndex = this.getChildIndices(currentIndex)[0];
  			switchValue = children[0];
  		} else {
  			switchIndex = this.getChildIndices(currentIndex)[1];
  			switchValue = children[1];
  		}
  		this.heap[switchIndex] = this.heap[currentIndex];
  		this.heap[currentIndex] = switchValue;
  		currentIndex = switchIndex;
  		children = this.getChildren(currentIndex);
  	}
  	return(prevRoot);
  }

  peek() {
  	return(this.heap[0]);
  }

  getParentIndex(childIndex) {
  	return(Math.floor((childIndex-1)/2));
  }

  getChildIndices(parentIndex) {
  	return([(2*parentIndex + 1), (2*parentIndex + 2)]);
  }

  getChildren(parentIndex) {
  	var children = [];
  	var childIndices = this.getChildIndices(parentIndex);
  	for (var i=0; i < childIndices.length; i++) {
  		children.push(this.heap[childIndices[i]]);
  	}
  	return(children);
  }

}

module.exports = BinaryHeap;