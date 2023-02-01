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

    STARTING_POSITIONS = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].freeze

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
                if i == 0 || i == 7
                    @grid[i].map!.with_index do |ele, j| 
                        ele = STARTING_POSITIONS[j].new([j,i], self, color)
                    end
                elsif i ==1 || i == 6
                    @grid[i].map!.with_index do |ele, j| 
                        ele = Pawn.new([j,i], self, color)
                    end
                end
            end
            i += 1
        end
    end

    def [](pos)
        @grid[pos[1]][pos[0]]
    end

    def []=(pos, value)
        @grid[pos[1]][pos[0]] = value
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