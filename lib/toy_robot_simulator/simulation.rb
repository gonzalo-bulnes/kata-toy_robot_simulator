require 'toy_robot_simulator/table'

module ToyRobotSimulator
  class Simulation

    attr_reader :table

    def initialize(output)
      @output = output
      @table = Table.new
    end

    def start
      @output.puts "Welcome to Toy Robot Simulator!"
    end
  end
end
