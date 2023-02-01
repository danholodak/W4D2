require_relative 'piece.rb'
require_relative 'slideable'

class Bishop < Piece
    include Slideable

    def move_dirs
        diagonal_dirs
    end
end