require 'spec_helper'

module ToyRobotSimulator
  describe Robot do

    let(:robot) { Robot.new() }

    it 'can report its location', public: true do
      expect(robot).to respond_to :report
    end

    it 'can be placed ont the table', public: true do
      expect(robot).to respond_to :place
    end

    it "by default is located at '0,1,NORTH'", private: true do
      expect(robot.send(:location)).to eq [0, 1, :north]
    end

    describe '#report', public: true do

      it 'returns the robot current location' do
        expect(robot.report).to eq '0,1,NORTH'
      end
    end

    describe '#place', public: true do

      it 'updates the robot current location' do
        expect{ robot.place([3, 5, :west]) }.to change{ robot.report }.from('0,1,NORTH').to('3,5,WEST')
      end
    end
  end
end
