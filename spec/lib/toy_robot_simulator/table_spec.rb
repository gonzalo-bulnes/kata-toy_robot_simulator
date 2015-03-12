require 'spec_helper'

module ToyRobotSimulator
  describe Table do

    let(:table) { Table.new() }

    it 'can determine if a position is beyond its boundaries', public: true do
      expect(table).to respond_to :beyond_boundaries?
    end

    it 'has boundaries!', private: true do
      expect(table).to respond_to :boundaries
    end

    describe 'is a ((0,0),(5,5)) square by default', public: true do

      it '[0,0] is part of the square' do
        expect(table.beyond_boundaries?([0,0])).to be_falsey
      end

      it '[0,1] is part of the square' do
        expect(table.beyond_boundaries?([0,1])).to be_falsey
      end

      it '[3,2] is part of the square' do
        expect(table.beyond_boundaries?([3,2])).to be_falsey
      end

      it '[5,5] is part of the square' do
        expect(table.beyond_boundaries?([5,5])).to be_falsey
      end

      it '[6,0] is beyond boundaries' do
        expect(table.beyond_boundaries?([6,0])).to be_truthy
      end

      it '[0,6] is beyond boundaries' do
        expect(table.beyond_boundaries?([0,6])).to be_truthy
      end

      it '[6,6] is beyond boundaries' do
        expect(table.beyond_boundaries?([6,6])).to be_truthy
      end

      it '[-1,0] is beyond boundaries' do
        expect(table.beyond_boundaries?([-1,0])).to be_truthy
      end

      it '[0,-1] is beyond boundaries' do
        expect(table.beyond_boundaries?([0,-1])).to be_truthy
      end

      it '[-4,6] is beyond boundaries' do
        expect(table.beyond_boundaries?([-4,6])).to be_truthy
      end
    end
  end
end
