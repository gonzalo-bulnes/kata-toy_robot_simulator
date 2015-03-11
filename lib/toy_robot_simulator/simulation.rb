module ToyRobotSimulator

  # Handle users input and output feedback
  class Simulation

    def initialize(output)
      @output = output
    end

    # Start the simulation so the user can input commands
    def start
      @output.puts "Welcome to Toy Robot Simulator! (Press Ctrl+D to exit.)"
      @output.puts "\nReady to receive commands when you are:\n"
    end

    # Process a simulator command
    #
    # Receives a command, validates it and outputs feedback.
    #
    # command - an user command String
    #
    # Returns nothing of interest.
    def input(command)
      @output.print "#{command.chomp}..."

      feedback = valid_command?(command) ? " done\n" : " invalid\n"
      @output.print feedback
    end

    private

      # Private: Return true when a command is valid, else false
      #
      # The parsing is quite strict for now, eventually
      # an effort could be done to be more toleant on user
      # input (e.g. be case insensitive, or tolerate multiple
      # spaces).
      #
      # command - an user command String
      def valid_command?(command)
        case command
        when /\AREPORT\z/
          return true
        when /\AMOVE\z/
          return true
        when /\ALEFT\z/
          return true
        when /\ARIGHT\z/
          return true
        when /\APLACE \d+,\d+,(SOUTH|EAST|NORTH|WEST)\z/
          return true
        else
          return false
        end
      end
  end
end
