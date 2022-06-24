class Board
attr_reader :max_height

    def self.build_stacks(n)
        Array.new(n){Array.new()}
    end

    def initialize (num, height)
        @max_height = height
       @stacks = Board.build_stacks(num)
        unless num >= 4 && height >= 4
            raise ArgumentError.new "rows and cols must be >=4"
        end
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.

    def print
        @stacks.each { |stack| p stack }
    end


    def add(token, i)
       
      if  @stacks[i].length < @max_height
        @stacks[i] << token
        return true
      else
        return false
      end
    end

    def vertical_winner?(token)
        @stacks.each do |stack|
        if stack.uniq.count(token) == 1 && stack.length == @max_height
            return true
        end
        end
        return false
    end

    def horizontal_winner?(token)
        (0..@max_height).any? do |i|
            @stacks.all? do |stack|
                stack[i] == token
            end
        end
    end

    def winner?(token)
        return true if horizontal_winner?(token) || vertical_winner?(token)
        return false
    end

end
