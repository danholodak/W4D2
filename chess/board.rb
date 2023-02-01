require_relative './pieces/piece'
require_relative './pieces/queen'
require_relative './pieces/king'
require_relative './pieces/rook'
require_relative './pieces/knight'
require_relative './pieces/bishop'
require_relative './pieces/null_piece'
require_relative './pieces/pawn'
require 'byebug'

class Board

    STARTING_POSITIONS = {
        Queen => [[0,4], [7,4]],
        King => [[0,3], [7,3]],
        Rook => [[0,0], [0,7], [7,0], [7,7]],
        Bishop => [[0,2], [0,5], [7,2], [7,5]],
        Knight => [[0,1], [0,6], [7,1], [7,6]],
        Pawn => [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7], [6,0], [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7]]
}.freeze
    attr_accessor :grid
   
    def initialize
        @grid = Array.new(8) {Array.new(8)}
        self.start_board
    end

    def start_board
        i = 0
        while i < 8 
            if (2..5).include?(i)
                @grid[i].map! do |position|
                    position = NullPiece.instance()
                end
            else
                color = 'white' if i == 0 || i == 1
                color = 'black' if i > 1
                @grid[i].map!.with_index do |ele, j| 
                    STARTING_POSITIONS.each do |k, v|
                        if v.include?([i,j])
                            ele = k.new([i,j], self, color)
                        end
                    end
                end
            end
            #debugger
            # else
            #     color = 'black'
            #     @grid[i].map!.with_index {|ele, j| ele = Piece.new([i,j], self, color)}
            i += 1
        end
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def move_piece(color, start_pos, end_pos)#check color on moves below later
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