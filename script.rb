require_relative "tree.rb"

# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
tree = Tree.new(Array.new(15){rand(1..100)})
tree
# 2. Confirm that the tree is balanced by calling `#balanced?`
puts tree.balanced?
# 3. Print out all elements in level, pre, post, and in order
print "\n"
print tree.level_order
print "\n"
print tree.preorder
print "\n"
print tree.postorder
print "\n"
print tree.inorder
print "\n"

# 4. try to unbalance the tree by adding several numbers > 100

tree.insert(200)
tree.insert(300)
tree.insert(400)
tree.insert(500)

# 5. Confirm that the tree is unbalanced by calling `#balanced?`
print "\n"
puts tree.balanced?


# 6. Balance the tree by calling `#rebalance`

tree.rebalance

# 7. Confirm that the tree is balanced by calling `#balanced?`

puts tree.balanced?
print "\n"
# 8. Print out all elements in level, pre, post, and in order

print tree.level_order
print "\n"
print tree.preorder
print "\n"
print tree.postorder
print "\n"
print tree.inorder
print "\n"