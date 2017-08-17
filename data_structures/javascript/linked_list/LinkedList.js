class Node {
  constructor(data, nextNode) {
    this.data = data || null;
    this.nextNode = nextNode || null;
  }
}

class LinkedList {
  constructor(headData) {
    if (headData) {
      this.head = new Node(headData);
    } else {
      this.head = null;
    }
    this.last = this.head;
  }

  length() {
    var count = 0;
    var node = this.head;
    while (node) {
      count++;
      node = node.nextNode;
    }
    
    return(count);
  }

  push(nextNodeData) {
    var nextNode = new Node(nextNodeData);
    if (this.head) {
      this.last.nextNode = nextNode;
      this.last = nextNode;
    } else {
      this.head = nextNode;
      this.last = nextNode;
    }
  }

  pop() {
    var returnData = this.last.data;
    this.last = this.search(this.traverse(this.length()-2));
    this.last.nextNode = null;
    return(returnData);
  }

  search(data) {
    var currentNode = this.head;
    while (currentNode.data !== data && currentNode !== null) {
      currentNode = currentNode.nextNode;
    }
    return(currentNode);
  }

  insertAfter(data, data_to_insert) {
    var newNode = new Node(data_to_insert);
    var insertionNode = this.search(data);
    newNode.nextNode = insertionNode.nextNode;
    insertionNode.nextNode = newNode;
  }

  shift(newHeadData) {
    var newHead = new Node(newHeadData);
    newHead.nextNode = this.head;
    this.head = newHead;
  }

  delete(data) {
    var currentNode = this.head;
    while (currentNode.nextNode !== null && currentNode.nextNode.data !== data) {
      currentNode = currentNode.nextNode;
    }
    if (currentNode.nextNode) {
      var deleteNode = currentNode.nextNode;
      currentNode.nextNode = deleteNode.nextNode;
      deleteNode.nextNode = null;
      return(deleteNode.data);
    } else if (currentNode === this.head) {
      this.head = null;
      this.last = null;
    } else {
      return(null);
    }
  }

  unshift() {
    var unshiftData = this.head.data;
    this.head = this.head.nextNode;
    if (!this.head) {
      this.last = null;
    }
    return(unshiftData);
  }

  traverse(index, startNodeData, startNode) {
    var startNodeData = startNodeData || this.head.data;
    var startNode = startNode || this.search(startNodeData);
    if (index === 0) {
      return(startNode.data);
    } else {
      return(this.traverse(index-1, startNode.nextNode.data, startNode.nextNode));
    }
  }
}

module.exports = LinkedList;
