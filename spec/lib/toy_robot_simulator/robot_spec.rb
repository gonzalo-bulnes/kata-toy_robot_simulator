require 'spec_helper'

module ToyRobotSimulator
  describe Robot do

    let(:robot) { Robot.new() }

    it 'can report its location', public: true do
      expect(robot).to respond_to :report
    end

    it "by default is located at '0,1,NORTH'", private: true do
      expect(robot.send(:location)).to eq '0,1,NORTH'
    end

    describe '#report', public: true do

      it 'returns the robot current location' do
        expect(robot.report).to eq '0,1,NORTH'
      end
    end
  end
end
