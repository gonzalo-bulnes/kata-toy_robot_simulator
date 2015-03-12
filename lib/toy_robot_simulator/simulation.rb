require 'toy_robot_simulator/robot'
require 'toy_robot_simulator/table'

module ToyRobotSimulator

  # Handle users input and output feedback
  class Simulation

    # Return the simulated Robot
    attr_reader :robot

    # Return the simulated Table
    attr_reader :table

    # Create a new simulation
    #
    # output - where command output and feedback will be printed
    # verbose - wether or not feedback shall be printed (Boolean), true by default
    #
    def initialize(output, verbose=true)
      @output = output
      @robot = Robot.new
      @table = Table.new
      @verbose = verbose
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

        robot_command_name = robot_command.shift # just to make it obvious
        robot_command_arguments = [table] + robot_command # the remaining arguments and the table

        if @robot.respond_to? robot_command_name
          command_response = @robot.send(robot_command_name, *robot_command_arguments)
          command_output = format_response(command_response)
        end
        feedback =  " done\n"
      else
        feedback =  " invalid\n"
      end

      @output.print feedback if verbose?
      @output.print "#{command_output}\n" unless command_output.nil?
    end

    def verbose?
      @verbose
    end

    private

      # Format the command response for output
      #
      # Returns a formatted String
      def format_response(command_response)
        unless command_response.nil?
          command_response.join(',').upcase
        else
          hint_to_place_the_robot_on_the_table
        end
      end

      def hint_to_place_the_robot_on_the_table
        'The robot is off the table. Hint: try to PLACE it.'
      end

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
          return [:place, [$1.to_i, $2.to_i, $3.downcase.to_sym]]
        else
          return nil
        end
      end
  end
end
