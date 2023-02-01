require_relative 'piece.rb'
require_relative 'steppable'

class Knight < Piece
    include Steppable

    def symbol
        ♞.colorize(color)
    end

    protected
    def move_diffs
        return KNIGHT_DIR
    end
end