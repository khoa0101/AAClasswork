class Board

  ROOKS = [[po1], [po2]...]
  KNIGHTS = [[po1], ]

  def self.build_board
    board = Array.new(8) { Array.new(8) }
    (0...8).each do |row|
      (0...8).each do |col|

      end
    end
  end

  def initialize
    @board = Board.build_board

  end

  def move_piece(start_pos, end_pos)

  end
end