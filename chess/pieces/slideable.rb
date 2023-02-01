module Slideable

    HORIZONTAL_DIRS = [
        [-1,0]
        [1,0]
        [0,1]
        [0,-1]
    ].freeze

    DIAGONAL_DIRS = [
        [-1,1]
        [1,1]
        [-1,-1]
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
            x,y = @pos 
            result << [a + x, b + y]
        end

    end

    private

    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves

        

    end

end