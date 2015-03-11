require 'spec_helper'

module ToyRobotSimulator
  describe Robot do

    let(:robot) { Robot.new() }

    it 'can report its location', public: true do
      expect(robot).to respond_to :report
    end

    it 'can be placed on the table', public: true do
      expect(robot).to respond_to :place
    end

    it 'can move', public: true do
      expect(robot).to respond_to :move
    end

    it 'can rotate left', public: true do
      expect(robot).to respond_to :left
    end

    it 'can rotate right', public: true do
      expect(robot).to respond_to :right
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

    describe '#move', public: true do

      context 'when the robot is facing EAST' do
        it 'moves the robot 1 unit toward EAST (first corrdinate increase)' do
          robot.place([3, 2, :east])

          expect{ robot.move }.to change{ robot.report }.from('3,2,EAST').to('4,2,EAST')
        end
      end

      context 'when the robot is facing SOUTH' do
        it 'moves the robot 1 unit toward SOUTH (second coordinate descrease)' do
          robot.place([3, 2, :south])

          expect{ robot.move }.to change{ robot.report }.from('3,2,SOUTH').to('3,1,SOUTH')
        end
      end

      context 'when the robot is facing WEST' do
        it 'moves the robot 1 unit toward WEST (first coordinate decrease)' do
          robot.place([3, 2, :west])

          expect{ robot.move }.to change{ robot.report }.from('3,2,WEST').to('2,2,WEST')
        end
      end

      context 'when the robot is facing NORTH' do
        it 'moves the robot 1 unit toward NORTH (second coordinate increase)' do
          robot.place([3, 2, :north])

          expect{ robot.move }.to change{ robot.report }.from('3,2,NORTH').to('3,3,NORTH')
        end
      end
    end

    describe '#left', public: true do

      context 'when the robot is facing EAST' do
        it 'rotates the robot to face NORTH' do
          robot.place([3, 2, :east])

          expect{ robot.left }.to change{ robot.report }.from('3,2,EAST').to('3,2,NORTH')
        end
      end

      context 'when the robot is facing SOUTH' do
        it 'rotates the robot to face EAST' do
          robot.place([3, 2, :south])

          expect{ robot.left }.to change{ robot.report }.from('3,2,SOUTH').to('3,2,EAST')
        end
      end

      context 'when the robot is facing WEST' do
        it 'rotates the robot to face SOUTH' do
          robot.place([3, 2, :west])

          expect{ robot.left }.to change{ robot.report }.from('3,2,WEST').to('3,2,SOUTH')
        end
      end

      context 'when the robot is facing NORTH' do
        it 'rotates the robot to face WEST' do
          robot.place([3, 2, :north])

          expect{ robot.left }.to change{ robot.report }.from('3,2,NORTH').to('3,2,WEST')
        end
      end
    end

    describe '#right', public: true do

      context 'when the robot is facing EAST' do
        it 'rotates the robot to face SOUTH' do
          robot.place([3, 2, :east])

          expect{ robot.right }.to change{ robot.report }.from('3,2,EAST').to('3,2,SOUTH')
        end
      end

      context 'when the robot is facing SOUTH' do
        it 'rotates the robot to face WEST' do
          robot.place([3, 2, :south])

          expect{ robot.right }.to change{ robot.report }.from('3,2,SOUTH').to('3,2,WEST')
        end
      end

      context 'when the robot is facing WEST' do
        it 'rotates the robot to face NORTH' do
          robot.place([3, 2, :west])

          expect{ robot.right }.to change{ robot.report }.from('3,2,WEST').to('3,2,NORTH')
        end
      end

      context 'when the robot is facing NORTH' do
        it 'rotates the robot to face EAST' do
          robot.place([3, 2, :north])

          expect{ robot.right }.to change{ robot.report }.from('3,2,NORTH').to('3,2,EAST')
        end
      end
    end
  end
end
