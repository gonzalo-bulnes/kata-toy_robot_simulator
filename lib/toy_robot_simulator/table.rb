module ToyRobotSimulator

  # A table
  class Table

    # Determine if a location is off the table boundaries
    #
    # location - an [x, y] Array of two numbers
    #
    # Returns true if the location is off the tabl, false instead.
    def beyond_boundaries?(location)
      boundaries.inject(false) { |beyond_at_least_one_boundary, boundary| beyond_at_least_one_boundary || boundary.call(location.first, location.last) }
    end

    # List the table boundaries
    #
    # Boundaries are Proc objects that receive a location `[x, y]` and
    # return false when the location is beyond the boundary - i.e the
    # location is off the table.
    #
    # Returns an Array of boundaries (Proc).
    def boundaries
      [
        Proc.new { |x, _| x < 0 },
        Proc.new { |x, _| x > 5 },
        Proc.new { |_, y| y < 0 },
        Proc.new { |_, y| y > 5 }
      ]
    end
  end
end
