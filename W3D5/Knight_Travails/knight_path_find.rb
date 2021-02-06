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

#--------------------------------------------------------------------

class KnightPathFinder
    attr_reader :root_node, :considered_positions
    def initialize(pos) # [0, 0]
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def self.valid_moves(pos)
        # listing all the 8 moves
        x, y = pos
        moves = [
            [x+1, y+2], [x-1, y+2],
            [x+1, y-2], [x-1, y-2],
            [x+2, y+1], [x-2, y+1],
            [x+2, y-1], [x-2, y-1],
        ]
        moves.reject! { |subarr| subarr[0] > 7 || subarr[1] > 7 || subarr[0] < 0 || subarr[1] < 0}
        # out of bound check
        moves
    end

    def new_moves_positions(pos)
        current_valid = KnightPathFinder.valid_moves(pos)
        new_array = []
        current_valid.each do |valid_pos|
            if !@considered_positions.include?(valid_pos)
                @considered_positions << valid_pos 
                new_array << valid_pos
            end
        end
        new_array
    end

    def build_move_tree
        # current_knight = queue.shift
        # current_node = current_knight.root_node
        queue = [self.root_node]
        until queue.empty?
            current_node = queue.shift
            array = self.new_moves_positions(current_node.value)
            array.each do |child_pos|
                child_node = PolyTreeNode.new(child_pos)
                current_node.add_child(child_node)
                queue << child_node
            end
        end
        self
    end

end

# p  KnightPathFinder.valid_moves([0,0])
# p  KnightPathFinder.valid_moves([7,7])
# p  KnightPathFinder.valid_moves([5,5])
# p  KnightPathFinder.valid_moves([4,0])

nait = KnightPathFinder.new([5,5])
# p nait.new_moves_positions(nait.root_node.value)
# p nait.considered_positions
# p nait.new_moves_positions(nait.considered_positions[1])
# p nait.considered_positions

p nait.build_move_tree



