describe("BinaryHeap", function() {

  var BinaryHeap = require('../BinaryHeap.js');
  var binaryHeap;

  beforeEach(function() {
    binaryHeap = new BinaryHeap([4, 2, 8, 9, 1, 10]);
  });
  
  describe("creating a MaxHeap", function() {
    it("creates an ordered binary heap", function() {
      expect(binaryHeap.heap).toEqual([10, 8, 9, 2, 1, 4]);
    });

    it("can peek at the max value", function() {
      expect(binaryHeap.peek()).toEqual(10);
    });
  });

  describe("inserting a node", function() {
    it("can insert a node", function() {
      binaryHeap.insert(10);
      binaryHeap.insert(7);
      expect(binaryHeap.heap).toEqual([10, 8, 10, 7, 1, 4, 9, 2]);
    });
  });

  describe("extracting the max value", function() {
    it("returns the max value", function() {
		  var maxVal = binaryHeap.extract();
      expect(maxVal).toEqual(10);
    });

    it("reorders the heap properly", function() {
		  var maxVal = binaryHeap.extract();
      expect(binaryHeap.heap).toEqual([9, 8, 4, 2, 1]);
    });
  });

});