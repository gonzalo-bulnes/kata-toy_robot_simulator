module ToyRobotSimulator
  class Location

    def initialize(table, row, col)
      raise ArgumentError, 'first argument must be a kind of ToyRobotSimulator::Table' unless table.kind_of? Table
      raise ArgumentError, 'second argument must be a kind of Fixnum' unless row.kind_of? Fixnum
      raise ArgumentError, 'third argument must be a kind of Fixnum' unless col.kind_of? Fixnum

      @table = table
      @row = row
      @col = col
    end
  end
end
