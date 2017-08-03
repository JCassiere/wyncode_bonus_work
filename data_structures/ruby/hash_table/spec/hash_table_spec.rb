require './hash_table.rb'

describe HashTable do

	before(:each) do
		@new_hash = HashTable.new
	end

	context "making a HashTable" do
		it "has a table attribute made of linked lists" do
			expect(@new_hash.table[0]).to be_a(LinkedList)
		end

		it "can return a hash key for a given key" do
			expect(@new_hash.hash_key("I'm Joe")).to eq("I'm Joe".hash % 256)
		end

		it "can return an empty linked list for a given key" do
			expect(@new_hash.get_bucket("I'm Joe").head).to be_nil
		end
	end

	context "adding an item" do
		before(:each) do
			@new_hash.insert("Joe", 25)
		end

		it "successfully adds an item" do
			expect(@new_hash.get_bucket("Joe").head.data).to eq(["Joe", 25])
		end

		it "has the key in its keys array" do
			expect(@new_hash.keys).to eq(["Joe"])
		end

		it "can overwrite a key's value" do
			@new_hash.insert("Joe", 36)
			expect(@new_hash.get_bucket("Joe").head.data).to eq(["Joe", 36])
		end

		it "can get a key's value" do
			expect(@new_hash.search("Joe")).to eq(25)
		end

		it "returns nil for a key that does not exist" do
			expect(@new_hash.search("Bob")).to be_nil
		end
	end

	context "deleting an item" do
		before(:each) do
			@new_hash.insert("Joe", 25)
			@new_hash.insert("Fred", 63)
			@new_hash.delete("Joe")
		end

		it "no longer contains the item" do
			expect(@new_hash.search("Joe")).to be_nil
		end

		it "no longer includes the key in its keys array" do
			expect(@new_hash.keys).to eq(["Fred"])
		end

		it "still contains other items" do
			expect(@new_hash.search("Fred")).to eq(63)
		end

	end

end