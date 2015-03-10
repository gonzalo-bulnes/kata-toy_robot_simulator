require 'spec_helper'

module ToyRobotSimulator
  describe Table do

    let(:table) { Table.new }

    it 'has specifications', public: true do
      expect(table.specs).to eq '5 rows x 5 cols, with (0,0) being the SOUTH WEST most corner'
    end

    it 'is 5 rows high', public: true do
      expect(table.specs).to match /\A5\ rows/
    end

    it 'is 5 colums large', public: true do
      expect(table.specs).to match /\ 5\ cols/
    end
  end
end
