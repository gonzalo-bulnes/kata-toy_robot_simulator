module ToyRobotSimulator
  class Simulation

    def initialize(output)
      @output = output
    end

    def start
      @output.puts "Welcome to Toy Robot Simulator!"
    end
  end
end
