module ToyRobotSimulator

  # A moving robot
  class Robot

    # Private: Return the robot current situation
    attr_reader :situation

    private :situation

    def initialize
      @situation = nil
    end

    # Update the robot current situation to face the direction at its left
    #
    # The table where the robot is located is not necessary by itself,
    # but it SHOULD be provided as a good practice in order to
    # enforce a standard signature for command methods.
    # You SHOULD provide it, again, but nobody is spying on you.
    #
    # table - the table where the robot is located, SHOULD be provided
    #
    # Returns nil. (Mainly used to produce no output.)
    def left(table=nil)

      return hint_to_place_the_robot_on_the_table if off_the_table?

      case situation.last
      when :north
        @situation[2] = :west
      when :east
        @situation[2] = :north
      when :south
        @situation[2] = :east
      when :west
        @situation[2] = :south
      end
      nil
    end

    # Update the robot current situation to face the direction at its right
    #
    # The table where the robot is located is not necessary by itself,
    # but it SHOULD be provided as a good practice in order to
    # enforce a standard signature for command methods.
    # You SHOULD provide it, again, but nobody is spying on you.
    #
    # table - the table where the robot is located, SHOULD be provided
    #
    # Returns nil. (Mainly used to produce no output.)
    def right(table=nil)

      return hint_to_place_the_robot_on_the_table if off_the_table?

      case situation.last
      when :north
        @situation[2] = :east
      when :east
        @situation[2] = :south
      when :south
        @situation[2] = :west
      when :west
        @situation[2] = :north
      end
      nil
    end

    # Update the robot current situation one unit toward in the direction it faces if it's safe
    #
    # table - a Table
    #
    # Returns nil. (Mainly used to produce no output.)
    def move(table)

      return hint_to_place_the_robot_on_the_table if off_the_table?

      case situation.last
      when :north
        @situation[1] += 1
      when :east
        @situation[0] += 1
      when :south
        @situation[1] -= 1
      when :west
        @situation[0] -= 1
      end
      nil
    end

    # Place the robot in the given situation if it is located on the table
    #
    # table - a Table
    # situation - the situation the robot should have
    #
    # Returns nil. (Mainly used to produce no output.)
    def place(table, situation)
      @situation = situation
      nil
    end

    # Return the robot current situation
    #
    # The table where the robot is located is not necessary by itself,
    # but it SHOULD be provided as a good practice in order to
    # enforce a standard signature for command methods.
    # You SHOULD provide it, again, but nobody is spying on you.
    #
    # table - the table where the robot is located, SHOULD be provided
    def report(table=nil)

      return hint_to_place_the_robot_on_the_table if off_the_table?

      situation.join(',').upcase
    end

    private

      def hint_to_place_the_robot_on_the_table
        'The robot is off the table. Hint: try to PLACE it.'
      end

      def off_the_table?
        @situation.nil?
      end

  end
end
