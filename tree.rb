class Node
    attr_accessor :left, :right, :data
    def initialize(data, left = nil, right = nil)
        @data = data
        @left = left
        @right = right
    end
end

class Tree
    attr_accessor :root
    def initialize(arr);
        arr = arr.uniq.sort
        @root = build_tree(arr)       
    end

    def build_tree(arr)
        return if arr.length == 0
    
        middle = arr.length / 2
        node = Node.new(arr[middle])
    
        if arr.length == 1
            return node
        else
            node.left = build_tree(arr[0..middle - 1])
            node.right = build_tree(arr[middle + 1..-1])
        
            return node
        end
    end

    def insert(value)
        start_node = @root
        loop do
            if start_node.data == value
                return                  
            elsif value < start_node.data
                next_node = start_node.left                
            else
                next_node = start_node.right
            end

            break if next_node.nil?

            start_node = next_node
        end

        if value < start_node.data
            start_node.left = Node.new(value)                
        else
            start_node.right = Node.new(value)
        end
    end

    def delete(value)
        node  = find(value)
        return if node.nil? 
        
        if node.left.nil? && node.right.nil?
            node = nil
        else
            if node.left.nil?
                node = node.right
            elsif node.right.nil?
                node = node.left
            else
                min_node = min_value()
                node.data = min_node.data
                min_node = nil
            end            
        end
    end

    def min_value
        start_node = @root
        #If a node to be deleted has two children then this function finds the inorder succesor which will replace it
        #See more on the article about deleting on the TOP page.
    end

    def find(value)
        start_node = @root
        loop do
            if value == start_node.data
                return start_node
            elsif value < start_node.data
                next_node = start_node.left
            else
                next_node = start_node.right
            end

            break if next_node.nil?

            start_node = next_node
        end
    end

end

tree = Tree.new([1,2,3,4,5,6])
tree.insert(7)






