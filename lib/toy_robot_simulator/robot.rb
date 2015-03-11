module ToyRobotSimulator
  class Robot

    def initialize
      @location = nil
      @off_the_table = true
    end

    def off_the_table?
      @off_the_table
    end

    def place!
      @off_the_table = false
    end
  end
end
