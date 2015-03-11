require 'toy_robot_simulator/robot'

module ToyRobotSimulator

  # Handle users input and output feedback
  class Simulation

    # Return the simulated Robot
    attr_reader :robot

    def initialize(output)
      @output = output
      @robot = Robot.new
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

      robot_command = known_command?(command)

      unless robot_command.nil?

        robot_command_name = robot_command.first # just to make it obvious

        if @robot.respond_to? robot_command_name
          command_output = @robot.send(*robot_command)
        end
        feedback =  " done\n"
      else
        feedback =  " invalid\n"
      end

      @output.print feedback
      @output.print command_output
    end

    private

      # Private: Return known command or nil
      #
      # The parsing is quite strict for now, eventually
      # an effort could be done to be more toleant on user
      # input (e.g. be case insensitive, or tolerate multiple
      # spaces).
      #
      # command - an user command String
      #
      # Returns an Array of arguments to `send` a known command to a Robot, or nil
      def known_command?(command)
        case command
        when /\AREPORT\z/
          return [:report]
        when /\AMOVE\z/
          return [:move]
        when /\ALEFT\z/
          return [:left]
        when /\ARIGHT\z/
          return [:right]
        when /\APLACE (\d+),(\d+),((SOUTH|EAST|NORTH|WEST))\z/
          return [:place, $1.to_i, $2.to_i, $3.downcase.to_sym]
        else
          return nil
        end
      end
  end
end
