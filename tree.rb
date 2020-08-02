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
    def initialize(arr)
        @root = build_tree(arr)       
    end

    def build_tree(arr)
        arr = arr.uniq.sort
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
            unless queue[0].left.nil?
                queue.append(queue[0].left)
            end
            unless queue[0].right.nil?
                queue.append(queue[0].right)
            end
            queue.shift
        end
        return values
    end

    def inorder(root = @root)
        return unless root
        arr = []
        arr << inorder(root.left) if root.left
        arr << root.data
        arr << inorder(root.right) if root.right
        arr.flatten
    end

    def preorder(root = @root)
        return unless root
        arr = []
        arr << root.data
        arr << preorder(root.left) if root.left
        arr << preorder(root.right) if root.right
        arr.flatten
    end

    def postorder(root = @root)
        return unless root
        arr = []
        arr << postorder(root.left) if root.left
        arr << postorder(root.right) if root.right
        arr << root.data
        arr.flatten
    end

    def height(root = @root)
        return 0 if root.nil?
        return 0 if root.left.nil? && root.right.nil?
        return [height(root.left), height(root.right)].max + 1
    end

    def depth(node, root = @root, count = 0)
        return 0 if node.nil?
        return count if root == node
        
        count += 1

        if node.data < root.data
            return depth(node, root.left, count)
        else
            return depth(node, root.right, count)
        end
    end

    def balanced?(root = @root)
        return true if root.nil?

        left_height = height(root.left)
        right_height = height(root.right)
        
        if (left_height - right_height).abs <= 1 && balanced?(root.left) && balanced?(root.right)
            return true
        else
            return false
        end
    end

    def rebalance
        arr = self.level_order
        @root = build_tree(arr)
    end
end


