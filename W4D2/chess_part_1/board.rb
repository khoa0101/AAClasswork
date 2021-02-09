require_relative "piece.rb"

class Board
  attr_reader :board

  @@INITIATIAL_POS = {
    "rook" => [[0, 0], [0, 7], [7, 7], [7, 7]],
    "knight" => [[0, 1], [0, 6], [7, 1], [7, 6]],
    "bishop" => [[0, 2],[0, 5], [7, 2], [7, 5]],
    "queen" => [[0, 3], [7, 3]],
    "king" => [[0, 4], [7, 4]],
    "pawn" => [
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

  def self.build_board
    Array.new(8) { Array.new(8) }
  end

  def initialize
    @board = Board.build_board

    (0...8).each do |row|
      (0...8).each do |col|
        pos = [row, col]
        @@INITIATIAL_POS.each do |k, v|
          if v.include?(pos)
            board[row][col] = (row < 2 ? Piece.new(:W, k, pos) : Piece.new(:B, k, pos))
            break
          else
            board[row][col] = Piece.new(nil, nil, pos)
          end
        end
      end
    end

  end

  def print
    @board.each do |row|
      row_pieces = []
      row.each do |piece|
        row_pieces << piece
      end
      p row_pieces
    end
  end

  def move_piece(start_pos, end_pos)
    row1, col1 = start_pos
    row2, col2 = end_pos
    if board[row1][col1].name.nil? 
      raise ArgumentError.new("there is no piece at the starting position")
    end
    if !board[row2][col2].name.nil? && board[row1][col1].color == board[row2][col2].color
      raise ArgumentError.new("occupied position at ending postion")
    end
    if board[row2][col2].nil?
      board[row1][col1], board[row2][col2] = board[row2][col2], board[row1][col1]
    else
      board[row2][col2] = board[row1][col1]
      board[row1][col1] = Piece.new(nil, nil, start_pos)
    end
  end

end

board = Board.new
board.print
p "-" * 60
board.move_piece([0,0], [5,0])
board.print
p "-" * 60
# board.move_piece([4,1], [4,2])
# board.print
# board.move_piece([7,5], [7,4])
# board.print
# p "-" * 60
board.move_piece([6,2], [1,2])
board.print