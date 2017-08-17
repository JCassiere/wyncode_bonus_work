describe("LinkedList", function() {
  var LinkedList = require("../LinkedList");
  var linkedList;
  var emptyLinkedList;
  var deletedData;
  var oldData;

  beforeEach(function() {
    emptyLinkedList = new LinkedList();
    linkedList = new LinkedList("initial head");
  });

  describe("creating a linked list", function() {
    it("does not have a head if one is not given", function() {
      expect(emptyLinkedList.head).toEqual(null);
    });

    it("has a head", function() {
      expect(linkedList.head.data).toEqual("initial head");
    });

    it("has its head as its last element", function() {
      expect(linkedList.head).toEqual(linkedList.last);
    });

    it("has a head with data", function() {
      expect(linkedList.head.data).toEqual("initial head");
    });

    it("can return its length", function() {
      linkedList.push("second node");
      expect(linkedList.length()).toEqual(2);
      expect(emptyLinkedList.length()).toEqual(0);
    });
  });

  describe("adding a node", function() {
    beforeEach(function() {
      linkedList.push("second_node");
    });

    it("has the new node at its end", function() {
      expect(linkedList.last.data).toEqual("second_node");
    });

    it("can add a node to an empty linked list", function() {
      emptyLinkedList.push("second_node");
      expect(emptyLinkedList.head.data).toEqual("second_node");
      expect(emptyLinkedList.head.data).toEqual(emptyLinkedList.last.data);
    });
  });

  describe("inserting a node in the middle", function() {
    beforeEach(function() {
      linkedList.push("second node");
      linkedList.insertAfter("initial head", "middle node");
    });

    it("inserts the node correctly", function() {
      expect(linkedList.head.nextNode.data).toEqual("middle node");
      expect(linkedList.head.nextNode.nextNode.data).toEqual("second node");
    });
  });

  describe("inserting a node at the beginning", function() {
    beforeEach(function() {
      linkedList.shift("new head");
    });
    it("has a new head", function() {
      expect(linkedList.head.data).toEqual("new head");
    });

    it("has a new head that points to the old one", function() {
      expect(linkedList.head.nextNode.data).toEqual("initial head");
    });
  });

  describe("deleting a node", function() {
    beforeEach(function() {
      linkedList.push("second node");
      linkedList.push("third node");
      deletedData = linkedList.delete("second node");
    });

    it("does not have the deleted node", function() {
      expect(linkedList.head.nextNode.data).not.toEqual("second node");
    });

    it("links the deleted node's pointer to the preceding node", function() {
      expect(linkedList.head.nextNode.data).toEqual("third node");
    });

    it("returns the data from the deleted node", function() {
      expect(deletedData).toEqual("second node");
    });
  });

  describe("deleting a node from a list of length 1", function() {
    it("is empty", function() {
      linkedList.delete("initial head");
      expect(linkedList.head).toEqual(null);
    });
  });

  describe("deleting a head", function() {
    it("has a new head", function() {
      linkedList.push("second node");      
      oldData = linkedList.unshift();
      expect(linkedList.head.data).toEqual("second node");
      expect(oldData).toEqual("initial head");
    });
  })

  describe("deleting the head of a list of length 1", function() {
    it("is empty", function() {
      linkedList.unshift();
      expect(linkedList.head).toEqual(null);
    });
  });

  describe("deleting the last item", function() {
    beforeEach(function() {
      linkedList.push("second node");    
      linkedList.push("third node");
      deletedData = linkedList.pop();
    });

    it("returns the deleted items", function() {
      expect(deletedData).toEqual("third node");
    });

    it("has the correct last item", function() {
      expect(linkedList.last.data).toEqual("second node");
    });
  });

  describe("traversing the list", function() {
    beforeEach(function() {
      linkedList.push("second node");
      linkedList.push("third node");
    })

    it("can traverse 1 step starting at the first node", function() {
      expect(linkedList.traverse(1)).toEqual("second node");
    })

    it("can traverse 2 steps starting at the first node", function() {
      expect(linkedList.traverse(2)).toEqual("third node");
    })


    it("can traverse 1 step starting at the second node", function() {
      expect(linkedList.traverse(1, "second node")).toEqual("third node");
    });
  });
});