module ToyRobotSimulator

  # A moving robot
  class Robot

    # Private: Return the robot current location
    attr_reader :location

    private :location

    def initialize
      @location = '0,1,NORTH'
    end

    # Return the robot current location
    def report
      location
    end
  end
end
