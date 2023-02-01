module Steppable
    KING_DIR = [
        [-1,0],
        [1,0],
        [0,1],
        [0,-1],
        [-1,1],
        [1,1],
        [-1,-1],
        [1,-1]
    ].freeze
        KNIGHT_DIR = [
            [-2,1],
            [2,1],
            [1,2],
            [1,-2],
            [-1,-2],
            [-2,-1],
            [-1,2],
            [2,-1]
            ].freeze

    def moves
        swag_moves = []
        x,y = @pos 
        move_diffs.each do |dir|
            a, b = dir
            new_x = a+x
            new_y = b+y
            if (new_x >=0 && new_x <=7 && new_y >=0 && new_y <=7)
                if @board[[new_x, new_y]].is_a?(NullPiece)
                    swag_moves << [new_x, new_y]
                elsif !@board[[new_x, new_y]].is_a?(NullPiece)
                    if self.color != @board[[new_x, new_y]].color 
                        swag_moves << [new_x, new_y]
                    end
                end
            end
        end
        swag_moves
    end

    private

    def move_diffs
        raise NotImplementedError
    end

end