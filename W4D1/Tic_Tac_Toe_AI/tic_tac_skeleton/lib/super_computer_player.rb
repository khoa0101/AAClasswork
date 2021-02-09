require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark) # game is a ttt class, mark is symbol
    node = TicTacToeNode.new(game.board, mark)
    childrens = node.children.shuffle
    winning_node = childrens.find { |child| child.winning_node?(mark) }
    return winning_node.prev_move_pos if winning_node
    winning_node = childrens.find { |child| !child.losing_node?(mark) }
    return winning_node.prev_move_pos if winning_node
    raise "Am I going to lose?!!"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
