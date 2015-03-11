module ToyRobotSimulator

  # A moving robot
  class Robot

    # Private: Return the robot current location
    attr_reader :location

    private :location

    def initialize
      @location = [0, 1, :north]
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
