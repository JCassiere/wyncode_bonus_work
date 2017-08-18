require './binary_heap.rb'

describe MaxHeap do

  before(:each) do
    @max_heap = MaxHeap.new([4, 2, 8, 9, 1, 10])
  end
  
  context "creating a MaxHeap" do
    it "creates an ordered binary heap" do
      expect(@max_heap.heap).to eq([10, 8, 9, 2, 1, 4])
    end

    it "can peek at the max value" do
      expect(@max_heap.peek).to eq(10)
    end
  end

  context "inserting a node" do
    it "can insert a node" do
      @max_heap.insert(10)
      @max_heap.insert(7)
      expect(@max_heap.heap).to eq([10, 8, 10, 7, 1, 4, 9, 2])
    end
  end

  context "extracting the max value" do
    before(:each) do
      @max = @max_heap.extract
    end

    it "returns the max value" do
      expect(@max).to eq(10)
    end

    it "reorders the heap properly" do
      expect(@max_heap.heap).to eq([9, 8, 4, 2, 1])
    end
  end

end

describe MinHeap do

  before(:each) do
    @min_heap = MinHeap.new([4, 2, 8, 9, 1, 10])
  end
  
  context "creating a MaxHeap" do
    it "creates an ordered binary heap" do
      expect(@min_heap.heap).to eq([1, 2, 8, 9, 4, 10])
    end

    it "can peek at the min value" do
      expect(@min_heap.peek).to eq(1)
    end

  end

  context "inserting a node" do
    it "can insert a node" do
      @min_heap.insert(10)
      @min_heap.insert(7)
      expect(@min_heap.heap).to eq([1, 2, 8, 7, 4, 10, 10, 9])
    end
  end

  context "extracting the min value" do
    before(:each) do
      @min = @min_heap.extract
    end

    it "returns the max value" do
      expect(@min).to eq(1)
    end

    it "reorders the heap properly" do
      expect(@min_heap.heap).to eq([2, 4, 8, 9, 10])
    end

  end

end
