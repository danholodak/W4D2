require_relative 'piece.rb'
require_relative 'slideable'

class Queen < Piece
    include Slideable
   
    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
    def symbol
        ♛.colorize(color)
    end
end