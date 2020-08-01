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

    def delete(root = @root, value)
        return if root.nil? 
        
        if value < root.data
            root.left = delete(root.left, value)
        elsif value > root.data
                root.right = delete(root.right, value)
        else
            if root.left.nil?
                temp_node = root.left
                root = nil
                return temp_node                
            elsif root.right.nil?
                temp_node = root.right
                root = nil
                return temp_node
            end
        
        temp_node = min_value(root.right)
        root.data = temp_node.data
        root.right = delete(root.right, value)

        return root
        end
    end

    def min_value(root)
        until root.left.nil?
            root = root.left
        end
        return root  
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

    def level_order
        queue = [@root]
        values = []
        until queue[0].nil?
            values.append(queue[0].data)
            queue.append(queue[0].left)
            queue.append(queue[0].right)
            queue.shift
        end
        return values
    end

    #returns an array of values with their respective techniques
    def inorder

    end

    def preorder

    end

    def postorder

    end

end

tree = Tree.new([1,2,3,4,5,6])
print tree.level_order






