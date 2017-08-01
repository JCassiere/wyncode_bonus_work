class BinaryTree
	attr_accessor :root, :left, :right

	def initialize(root_value, left = nil, right = nil)
		@root_value = root_value
		@left = left
		@right = right
	end

	def set_left_child(left_child_root, grandchild_left = nil, grandchild_right = nil)
		@left = BinaryTree.new(left_child_root, grandchild_left, grandchild_right)
	end

	def set_right_child(right_child_root, grandchild_left = nil, grandchild_right = nil)
		@right = BinaryTree.new(right_child_root, grandchild_left, grandchild_right)
	end

	def traverse(level=0)
		puts "Level #{level} Root: #{@root_value}"
		level += 1
		if left
			print "Left: " 
			@left.traverse(level)
		end
		if right
			print "Right: "
			@right.traverse(level)
		end
	end

end

# my_tree = BinaryTree.new(7)
# my_tree.set_left_child(4)
# my_tree.set_right_child(9)
# my_tree.left.set_left_child(13)
# my_tree.left.set_right_child(21)
# my_tree.right.set_right_child(101)
# my_tree.right.set_left_child(67)
# my_tree.traverse