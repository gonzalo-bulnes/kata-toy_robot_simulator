module ToyRobotSimulator
  class Simulation

    def initialize(output)
      @output = output
    end

    def start
      @output.puts "Welcome to Toy Robot Simulator! (Press Ctrl+D to exit.)"
    end

    def input(command)
      @output.print "#{command.chomp}..."
      @output.print " done\n"
    end
  end
end
