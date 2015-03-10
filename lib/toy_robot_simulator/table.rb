module ToyRobotSimulator
  class Table

    def initialize
      @rows = 5
      @cols = 5
    end

    def specs
      "#{ @rows } rows x #{ @cols } cols, with (0,0) being the SOUTH WEST most corner"
    end
  end
end
