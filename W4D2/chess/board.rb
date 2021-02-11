require_relative "./pieces/null_piece.rb"
require_relative "./pieces/rook.rb"
require_relative "./pieces/bishop.rb"
require_relative "./pieces/knight.rb"
require_relative "./pieces/king.rb"
require_relative "./pieces/pawn.rb"
require_relative "./pieces/queen.rb"

class Board
  attr_reader :grid

  @@INITIAL_POS = {
    Rook => [[0, 0], [0, 7], [7, 0], [7, 7]],
    Knight => [[0, 1], [0, 6], [7, 1], [7, 6]],
    Bishop => [[0, 2],[0, 5], [7, 2], [7, 5]],
    Queen => [[0, 3], [7, 3]],
    King => [[0, 4], [7, 4]],
    Pawn => [
      [1, 0], [1, 1],
      [1, 2], [1, 3],
      [1, 4], [1, 5],
      [1, 6], [1, 7],
      [6, 0], [6, 1],
      [6, 2], [6, 3],
      [6, 4], [6, 5],
      [6, 6], [6, 7]
    ]
  }

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }

    (0...8).each do |row|
      (0...8).each do |col|
        pos = [row, col]
        @@INITIAL_POS.each do |k, v|
          if v.include?(pos)
            grid[row][col] = (row < 2 ? k.new(:W, self, pos) : k.new(:B, self, pos))
            break
          end
        end
      end
    end

  end

  def render
    grid.each do |row|
      row_pieces = []
      row.each { |piece| row_pieces << piece.to_s }
      p row_pieces
    end
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].possible_moves.include?(end_pos)
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.instance
    else
      raise ArgumentError.new("invalid move")
    end    
  end

  def find_king(color)
    (0...8).each do |row|
      (0...8).each do |col|
        return [row, col] if grid[row][col].color == color && grid[row][col].name == "king"
      end
    end
    nil
  end

  def checkmate
    
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.render
  # board[[4,5]] = Rook.new(:B, board, [4,5])
  # p board[[4,5]].move_dirs # => [[4,6],[4,7]  [4,4],[4,3],[4,2],[4,1],[4,0]   [3,5],[2,5],[1,5],[0,5]  [5,5],[6,5],[7,5]]
  # board[[4,5]] = Bishop.new(:B, board, [4,5])
  # p board[[4,5]].move_dirs # => [[5,6],[6,7]  [3,4],[2,3],[1,2],[0,1]    [3,6],[2,7]   [5,4],[6,3],[7,2]]
  # board[[4,5]] = Queen.new(:B, board, [4,5])
  # p board[[4,5]].move_dirs 
  # =>   [[4,6],[4,7]  [4,4],[4,3],[4,2],[4,1],[4,0]   [3,5],[2,5],[1,5]  [5,5]]
  # =>   [[5,6]  [3,4],[2,3],[1,2]   [3,6],[2,7]   [5,4]]
  # board[[4,5]] = Knight.new(:B, board, [4,5])
  # p board[[4,5]].moves_diff
  board.grid.each { |row| row.each { |piece| p "#{piece.to_s} : #{piece.possible_moves}" } }  
end


