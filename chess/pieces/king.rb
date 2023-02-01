require_relative 'piece.rb'
require_relative 'steppable'

class King < Piece
    include Steppable

end