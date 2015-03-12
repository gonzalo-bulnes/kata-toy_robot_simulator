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
    # Returns the situation of the robot or nil if it is off the table
    def left(table=nil)

      return nil if off_the_table?

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
      situation
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
    # Returns the situation of the robot or nil if it is off the table
    def right(table=nil)

      return nil if off_the_table?

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
      situation
    end

    # Update the robot current situation one unit toward in the direction it faces if it's safe
    #
    # table - the Table where the robot is situated
    #
    # Returns the situation of the robot or nil if it is off the table
    def move(table)

      return nil if off_the_table?

      next_situation = situation.dup

      case next_situation.last
      when :north
        next_situation[1] += 1
      when :east
        next_situation[0] += 1
      when :south
        next_situation[1] -= 1
      when :west
        next_situation[0] -= 1
      end

      next_location = next_situation.slice(0,2)

      @situation = next_situation unless table.beyond_boundaries?(next_location)
      situation
    end

    # Place the robot in the given situation if it is located on the table
    #
    # table - the Table where the robot is situated
    # situation - the situation the robot should have
    #
    # Returns the situation of the robot or nil if it is off the table
    def place(table, requested_situation)
      next_situation = requested_situation.dup

      next_location = next_situation.slice(0,2)
      @situation = next_situation unless table.beyond_boundaries?(next_location)
      situation
    end

    # Return the robot current situation
    #
    # The table where the robot is located is not necessary by itself,
    # but it SHOULD be provided as a good practice in order to
    # enforce a standard signature for command methods.
    # You SHOULD provide it, again, but nobody is spying on you.
    #
    # table - the table where the robot is located, SHOULD be provided
    #
    # Returns the situation of the robot or nil if it is off the table
    def report(table=nil)

      # situation is nil when off_the_table? but the following keeps the condition explicit
      return nil if off_the_table?

      situation
    end

    private

      def hint_to_place_the_robot_on_the_table
        raise 'DEPRECATED'
        'The robot is off the table. Hint: try to PLACE it.'
      end

      def off_the_table?
        @situation.nil?
      end

  end
end
