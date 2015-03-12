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
      beyond_at_least_one_boundary = false
      boundaries.each do |boundary|
        beyond_at_least_one_boundary ||= boundary.call(location.first, location.last)
      end
      beyond_at_least_one_boundary
    end

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
