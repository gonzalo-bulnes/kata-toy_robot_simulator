require 'spec_helper'

module ToyRobotSimulator
  describe Table do

    let(:table) { Table.new() }

    it 'can determine if a position is beyond its boundaries', public: true do
      expect(table).to respond_to :beyond_boundaries?
    end
  end
end
