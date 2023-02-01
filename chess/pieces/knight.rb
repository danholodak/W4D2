require_relative 'piece.rb'
require_relative 'steppable'

class Knight < Piece
    include Steppable

    def symbol
        ♞.colorize(color)
    end
end