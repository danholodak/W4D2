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
        x , y = end_pos
        if !(x >= 0 && x < 8 && y >= 0 && y < 8) #check if end_pos in grid
            raise "Please pick a position inside the board."
        end
        a_pos = grid[start_pos[0]][start_pos[1]]
        b_pos = grid[end_pos[0]][end_pos[1]]
        if a_pos.nil?
            raise "Please pick a start position with a piece."
        elsif !b_pos.nil?
            raise "Please pick an empty end position."
        else
            a_pos.pos = end_pos
            grid[start_pos[0]][start_pos[1]], grid[end_pos[0]][end_pos[1]] =  grid[end_pos[0]][end_pos[1]], grid[start_pos[0]][start_pos[1]]
        end
    end
end