module ToyRobotSimulator

  # A moving robot
  class Robot

    # Private: Return the robot current situation
    attr_reader :situation

    private :situation

    def initialize
      @situation = [0, 1, :north]
    end

    # Update the robot current situation to face the direction at its left
    def left
      case situation.last
      when :north
        @situation[2] = :west
      when :east
        @situation[2] = :north
      when :south
        @situation[2] = :east
      when :west
        @situation[2] = :south
      end
    end

    # Update the robot current situation to face the direction at its right
    def right
      case situation.last
      when :north
        @situation[2] = :east
      when :east
        @situation[2] = :south
      when :south
        @situation[2] = :west
      when :west
        @situation[2] = :north
      end
    end

    # Update the robot current situation one unit toward in the direction it faces
    def move
      case situation.last
      when :north
        @situation[1] += 1
      when :east
        @situation[0] += 1
      when :south
        @situation[1] -= 1
      when :west
        @situation[0] -= 1
      end
    end

    # Update the robot current situation
    def place(situation)
      @situation = situation
      nil
    end

    # Return the robot current situation
    def report
      situation.join(',').upcase
    end
  end
end
