require_relative "../piece.rb"

class Pawn < Piece
    attr_reader :symbol, :valid_moves

    def initialize(color, board, pos)
        super
        @symbol = :P
        @valid_moves = []
    end

    def at_start_row?
        return true if self.color == :W && self.pos[0] == 1
        return true if self.color == :B && self.pos[0] == 6
        return false
    end

    def forward_steps
        moves = []
        if self.color == :W
            foward_pos = [self.pos[0] + 1, self.pos[1]]
            foward_two_pos = [self.pos[0] + 2, self.pos[1]]
        else
            foward_pos = [self.pos[0] - 1, self.pos[1]]
            foward_two_pos = [self.pos[0] - 2, self.pos[1]]
        end

        if at_start_row?
            if board[foward_pos].empty? 
                moves << foward_pos if valid_pos?(foward_pos)
                moves << foward_two_pos if board[foward_two_pos].empty? && valid_pos?(foward_two_pos)
            end
        else
            moves << foward_pos if board[foward_pos].empty? && valid_pos?(foward_pos)
        end
        @valid_moves.concat(moves)
        moves
    end

    def diagonal_attacks
        if self.color == :W
            forward_left = [self.pos[0] + 1, self.pos[1] - 1]
            forward_right = [self.pos[0] + 1, self.pos[1] + 1]
        else
            forward_left = [self.pos[0] - 1, self.pos[1] - 1]
            forward_right = [self.pos[0] - 1, self.pos[1] + 1]
        end

        attacks = []
        if valid_pos?(forward_left) && !board[forward_left].empty?
            attacks << forward_left if board[forward_left].color != self.color
        end

        if valid_pos?(forward_right) && !board[forward_right].empty?
            attacks << forward_right if board[forward_right].color != self.color
        end
        @valid_moves.concat(attacks)
        attacks
    end

    def possible_moves
        self.forward_steps
        self.diagonal_attacks
        @valid_moves
    end
end
  