module ToyRobotSimulator

  # A table
  class Table

    # Determine if a location is off the table boundaries
    #
    # For now, the table is infinite :)
    #
    # location - an [x, y] Array of two numbers
    #
    # Returns false.
    def beyond_boundaries?(location)
      false
    end
  end
end
