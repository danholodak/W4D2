require_relative 'piece.rb'

class Pawn < Piece


    def symbol
        ♟.colorize(color)
    end

    def moves

    end

    private

    def at_start_row?
        if (pos[0] == 1 && color == "white") || (pos[0] == 6 && color == "black")
            return true
        else
            false
        end
    end

    def forward_dir
        if color == "white"
            return  1
        elsif color == "black"
            return -1
        end
    end

    def forward_steps
        possible_dirs = []
        if at_start_row?
            possible_dirs << [0,(2 * forward_dir)]
        end
        possible_dirs << [0,forward_dir]

        possible_dirs
    end
    def side_attacks
        possible_dirs = []
        x,y = @pos
        if @board[x+1][y+1]

    end

end
