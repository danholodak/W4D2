require_relative 'piece'
require 'byebug'

class Board
    attr_accessor :grid
   
    def initialize
        @grid = Array.new(8) {Array.new(8)}
        self.start_board
    end

    def start_board
        i = 0
        while i < 8 
            if (2..5).include?(i)
                i += 1
                next
            end
            #debugger
            @grid[i].map!.with_index {|ele, j| ele = Piece.new([i,j])}
            i += 1
        end
    end

    def move_piece(start_pos, end_pos)

    end
end