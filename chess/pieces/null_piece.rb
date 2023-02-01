require "singleton"
require_relative 'piece.rb'

class NullPiece < Piece
    include Singleton

    def initialize

    end
    
    def symbol
        🙾.colorize(color)
    end
end