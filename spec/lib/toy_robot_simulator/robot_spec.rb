require 'spec_helper'

module ToyRobotSimulator
  describe Robot do

    let(:robot) { Robot.new }

    it 'can be off the table', public: true do
      expect(robot).to respond_to :off_the_table?
    end

    it 'can be placed on the table', public: true do
      expect(robot).to respond_to :place!
    end

    describe 'is off the table', public: true do

      it 'by default' do
        expect(robot.off_the_table?).to be_truthy
      end

      context 'until placed on the table' do

        it 'then is no longer off the table' do
          robot.place!
          expect(robot.off_the_table?).to be_falsey
        end
      end
    end
  end
end
