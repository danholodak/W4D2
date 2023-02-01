module Slideable

    HORIZONTAL_DIRS = [
        [-1,0],
        [1,0],
        [0,1],
        [0,-1]
    ].freeze

    DIAGONAL_DIRS = [
        [-1,1],
        [1,1],
        [-1,-1],
        [1,-1]
    ].freeze

    def horizontal_dirs
        return HORIZONTAL_DIRS
    end

    def diagonal_dirs
        return DIAGONAL_DIRS
    end

    def moves
        result = []
        move_dirs.each do |dir|
            a,b = dir
            result += grow_unblocked_moves(a, b)
        end
        result
    end
    
    private
    
    def move_dirs
        raise NotImplementedError
    end
    
    def grow_unblocked_moves(dx, dy)
        good_moves = []
        x,y = @pos 
        block = false
        new_x = x 
        new_y = y 
        while !block && new_x >=0 && new_x <=7 && new_x >=0 && new_x <=7
            new_x += dx 
            new_y += dy 
            if @board[[new_x, new_y]].is_a?(NullPiece)
                good_moves << [new_x, new_y]
            elsif !@board[[new_x, new_y]].is_a?(NullPiece)
                if self.color != @board[[new_x, new_y]].color 
                    good_moves << [new_x, new_y]
                end
                block = true
            end
        end
        good_moves #.select{|move| move[0] >= 0 && move[0] <=7 && move[1] >= 0 && move[0] <=7}
    end

end