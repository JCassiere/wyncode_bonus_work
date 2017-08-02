require './linked_list.rb'

describe LinkedList  do	

	before(:each) do
		@empty_linked_list = LinkedList.new
		@linked_list = LinkedList.new("initial head")
	end

	context "creating a linked list" do
		it "does not have a head if one is not given" do
			expect(@empty_linked_list.head).to be_nil
		end

		it "has a head" do
			expect(@linked_list.head.data).to eq("initial head")
		end

		it "has its head as its last element" do
			expect(@linked_list.head).to eq(@linked_list.last)
		end

		it "has a head with data" do
			expect(@linked_list.head.data).to eq("initial head")
		end

		it "can return its length" do
			@linked_list.add_next("second node")
			expect(@linked_list.length).to eq(2)
			expect(@empty_linked_list.length).to eq(0)
		end
	end

	context "adding a node" do
		before(:each) do
			@linked_list.add_next("second_node")
		end

		it "has the new node at its end" do
			expect(@linked_list.last.data).to eq("second_node")
		end

		it "can add a node to an empty linked list" do
			@empty_linked_list.add_next("second_node")
			expect(@empty_linked_list.head.data).to eq("second_node")
			expect(@empty_linked_list.head.data).to eq(@empty_linked_list.last.data)
		end
	end

	context "inserting a node in the middle" do
		before(:each) do
			@linked_list.add_next("second node")
			@linked_list.insert_after("initial head", "middle node")
		end

		it "inserts the node correctly" do
			expect(@linked_list.head.next_node.data).to eq("middle node")
			expect(@linked_list.head.next_node.next_node.data).to eq("second node")
		end
	end

	context "inserting a node at the beginning" do
		before(:each) do 
			@linked_list.insert_head("new head")
		end
		it "has a new head" do
			expect(@linked_list.head.data).to eq("new head")
		end

		it "has a new head that points to the old one" do
			expect(@linked_list.head.next_node.data).to eq("initial head")
		end
	end

	context "deleting a node" do
		before(:each) do
			@linked_list.add_next("second node")
			@linked_list.add_next("third node")
			@linked_list.delete_after("initial head")
		end

		it "does not have the deleted node" do
			expect(@linked_list.head.next_node.data).not_to eq("second node")
		end

		it "links the deleted node's pointer to the preceding node" do
			expect(@linked_list.head.next_node.data).to eq("third node")
		end
	end

	context "deleting a head" do

		it "has a new head" do
			@linked_list.add_next("second node")			
			@linked_list.delete_head
			expect(@linked_list.head.data).to eq("second node")
		end
	end

	context "deleting the head of a list of length 1" do
		it "is empty" do
			@linked_list.delete_head
			expect(@linked_list.head).to be_nil
		end

	end

	context "traversing the list" do
		before(:each) do
			@linked_list.add_next("second node")
			@linked_list.add_next("third node")
		end

		it "can traverse 1 step starting at the first node" do
			expect(@linked_list.traverse(1)).to eq("second node")
		end

		it "can traverse 2 steps starting at the first node" do
			expect(@linked_list.traverse(2)).to eq("third node")
		end


		it "can traverse 1 step starting at the second node" do
			expect(@linked_list.traverse(1, "second node")).to eq("third node")
		end
	end


end