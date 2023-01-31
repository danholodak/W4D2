require "singleton"

class Piece 
    attr_accessor :pos

    def initialize(pos, board, color)
        @pos = pos
        @board = board
        @color = color

    end

    def moves

    end
end

class Bishop < Piece


end

class Rook < Piece


end

class Queen < Piece


end

class King < Piece


end

class Pawn < Piece


end

class Knight < Piece


end

class NullPiece < Piece
    include Singleton

end