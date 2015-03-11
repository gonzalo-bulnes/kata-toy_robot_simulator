module ToyRobotSimulator

  # A moving robot
  class Robot

    # Private: Return the robot current location
    attr_reader :location

    private :location

    def initialize
      @location = [0, 1, :north]
    end

    # Update the robot current location to face the direction at its left
    def left
      case location.last
      when :north
        @location[2] = :west
      when :east
        @location[2] = :north
      when :south
        @location[2] = :east
      when :west
        @location[2] = :south
      end
    end

    # Update the robot current location to face the direction at its right
    def right
      case location.last
      when :north
        @location[2] = :east
      when :east
        @location[2] = :south
      when :south
        @location[2] = :west
      when :west
        @location[2] = :north
      end
    end

    # Update the robot current location one unit toward in the direction it faces
    def move
      case location.last
      when :north
        @location[1] += 1
      when :east
        @location[0] += 1
      when :south
        @location[1] -= 1
      when :west
        @location[0] -= 1
      end
    end

    # Update the robot current location
    def place(location)
      @location = location
      nil
    end

    # Return the robot current location
    def report
      location.join(',').upcase
    end
  end
end
