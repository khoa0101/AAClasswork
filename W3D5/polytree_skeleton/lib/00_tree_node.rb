class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(node) # this node is potential parent
        @parent.children.delete(self) if @parent != nil
        @parent = node
        if !node.nil?
            node.children << self if !node.children.include?(self)
        end
    end

    def add_child(node) # this node is a potential child
        node.parent = self
        self.children << node if !self.children.include?(node)
    end

    def remove_child(node) # a child node
        node.parent = nil
        if self.children.include?(node)
            self.children.delete(node)
        else
            raise "No existing child to delete!!!"
        end
    end

    def dfs(val) # not a node
        return self if self.value == val
        result = nil
        self.children.each do |child|
            result = child.dfs(val)
            return result if result != nil
        end
        result
    end

    def bfs(val) # not a node
        queue = [self]
        until queue.empty?
            checking = queue.shift
            return checking if checking.value == val
            checking.children.each do |child|
                queue << child
            end
        end
        nil
    end

end