var LinkedList = require("../linked_list/LinkedList.js");

class HashTable {
  constructor(numBucketsPower) {
  	var numBucketsPower = numBucketsPower || 8
  	this.table = [];
    this.keys = [];
    for (var i=0; i < Math.pow(2, numBucketsPower); i++) {
	    this.table.push(new LinkedList());
    }
    this.tableLength = this.table.length;
  }

  hashKey(key) {
    return(key.hashCode() % this.tableLength);
  }

  getBucket(key) {
  	return(this.table[this.hashKey(key)]);
  }

  getNode(key) {
  	var currentNode = this.getBucket(key).head;
  	while (currentNode) {
  		if (currentNode.data[0] === key) {
  			return(currentNode);
  		}
  		currentNode = currentNode.nextNode;
  	}
  	return(null);
  }

  insert(key, value) {
  	var node = this.getNode(key);
  	if (node) {
  		node.data[1] = value;
  	} else {
  		this.getBucket(key).push([key, value]);
  		this.keys.push(key);
  	}
  }

  search(key) {
  	var node = this.getNode(key);
  	return(node ? node.data[1] : null);
  }

  delete(key) {
  	this.getBucket(key).delete(this.getNode(key).data);
  	var key_index = this.keys.indexOf(key);
  	if (key_index !== -1) {
	  	this.keys.splice(key_index, 1);
  	}
  }
}

/*Caveat - each key must be a string*/
/*This function was taken from http://werxltd.com/*/
String.prototype.hashCode = function(){
    var hash = 0;
    if (this.length == 0) return hash;
    for (i = 0; i < this.length; i++) {
        char = this.charCodeAt(i);
        hash = ((hash<<5)-hash)+char;
        hash = hash & hash; // Convert to 32bit integer
    }
    return hash;
}

module.exports = HashTable;
