require_relative 'piece.rb'
require_relative 'steppable'

class King < Piece
    include Steppable
    

    def symbol
        ♚.colorize(color)
    end
end