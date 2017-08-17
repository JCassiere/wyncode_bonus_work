describe("HashTable", function() {
  var HashTable = require("../HashTable.js");
  var newHash;

  beforeEach(function() {
    newHash = new HashTable()
  });

  describe("making a HashTable", function() {
    it("can return a hash key for a given key", function() {
      expect(newHash.hashKey("I'm Joe")).toEqual("I'm Joe".hashCode() % 256);
    });

    it("can return an empty linked list for a given key", function() {
      expect(newHash.getBucket("I'm Joe").head).toEqual(null);
    });
  });

  describe("adding an item", function() {
    beforeEach(function() {
      newHash.insert("Joe", 25);
    });

    it("successfully adds an item", function() {
      expect(newHash.getBucket("Joe").head.data).toEqual(["Joe", 25]);
    });

    it("has the key in its keys array", function() {
      expect(newHash.keys).toEqual(["Joe"]);
    });

    it("can overwrite a key's value", function() {
      newHash.insert("Joe", 36)
      expect(newHash.getBucket("Joe").head.data).toEqual(["Joe", 36]);
    });

    it("can get a key's value", function() {
      expect(newHash.search("Joe")).toEqual(25);
    });

    it("returns null for a key that, function() {es not exist", function() {
      expect(newHash.search("Bob")).toEqual(null);
    });
  });

  describe("deleting an item", function() {
    beforeEach(function() {
      newHash.insert("Joe", 25)
      newHash.insert("Fred", 63)
      newHash.delete("Joe")
    });

    it("no longer contains the item", function() {
      expect(newHash.search("Joe")).toEqual(null);
    });

    it("no longer includes the key in its keys array", function() {
      expect(newHash.keys).toEqual(["Fred"]);
    });

    it("still contains other items", function() {
      expect(newHash.search("Fred")).toEqual(63);
    });

  });

});