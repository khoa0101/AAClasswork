require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over? 
      return board.winner != evaluator && board.won?
    end

    if self.next_mover_mark == evaluator
      self.children.all? { |child| child.losing_node?(evaluator) }
    else
      self.children.any? { |child| child.losing_node?(evaluator) }
    end

  end

  def winning_node?(evaluator)
    if board.over? 
      return board.winner == evaluator #&& board.won?
    end

    if self.next_mover_mark == evaluator
      self.children.any? { |child| child.winning_node?(evaluator) }
    else
      self.children.all? { |child| child.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    array = [] # stores 9 boards
    (0...board.rows.length).each do |i|
      (0...board.rows.length).each do |j|
        if board[[i,j]].nil?
          # next_mover_mark = (next_mover_mark == :o ? :x : :o)
          something = board.dup
          # after pos is empty we swap the next mover mark
          something[[i,j]] = next_mover_mark
          next_mover_mark = (next_mover_mark == :o ? :x : :o)
          node = TicTacToeNode.new(something, next_mover_mark, [i, j])
          @prev_move_pos = [i, j]
          array << node
        end
      end
    end
    return array
  end
end
