require 'spec_helper'

module ToyRobotSimulator
  describe Robot do

    let(:robot) { Robot.new() }
    let(:table) { Table.new() }

    it 'can report its situation', public: true do
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

    it "by default is off the table", private: true do
      expect(robot.send(:situation)).to eq nil
    end

    describe '#report', public: true do

      it 'suggests to place it on the table' do
        expect(robot.report).to eq 'The robot is off the table. Hint: try to PLACE it.'
      end

      context 'when the robot is on the table' do

        it 'returns the robot current situation' do
          allow(robot).to receive(:situation).and_return([0, 1, :north])
          allow(robot).to receive(:off_the_table?).and_return(false)

          expect(robot.report).to eq '0,1,NORTH'
        end
      end
    end

    describe '#place', public: true do

      it 'situates the robot on the table' do
        expect{ robot.place(table, [3, 5, :west]) }.to change{ robot.report }.from("The robot is off the table. Hint: try to PLACE it.").to('3,5,WEST')
      end

      context 'when the robot is on the table' do

        it 'updates the robot current situation' do
          robot.place(table, [0, 1, :north]) # that's ok because the case has been tested just above!

          expect{ robot.place(table, [3, 5, :west]) }.to change{ robot.report }.from('0,1,NORTH').to('3,5,WEST')
        end
      end
    end

    describe '#move', public: true do

      context 'when the robot is off the table' do

        it 'suggests to place it on the table' do
          allow(robot).to receive(:off_the_table?).and_return(true)

          expect(robot.move(table)).to eq 'The robot is off the table. Hint: try to PLACE it.'
        end
      end

      context 'when the robot is facing EAST' do
        it 'moves the robot 1 unit toward EAST (first corrdinate increase)' do
          robot.place(table, [3, 2, :east])

          expect{ robot.move(table) }.to change{ robot.report }.from('3,2,EAST').to('4,2,EAST')
        end
      end

      context 'when the robot is facing SOUTH' do
        it 'moves the robot 1 unit toward SOUTH (second coordinate descrease)' do
          robot.place(table, [3, 2, :south])

          expect{ robot.move(table) }.to change{ robot.report }.from('3,2,SOUTH').to('3,1,SOUTH')
        end
      end

      context 'when the robot is facing WEST' do
        it 'moves the robot 1 unit toward WEST (first coordinate decrease)' do
          robot.place(table, [3, 2, :west])

          expect{ robot.move(table) }.to change{ robot.report }.from('3,2,WEST').to('2,2,WEST')
        end
      end

      context 'when the robot is facing NORTH' do
        it 'moves the robot 1 unit toward NORTH (second coordinate increase)' do
          robot.place(table, [3, 2, :north])

          expect{ robot.move(table) }.to change{ robot.report }.from('3,2,NORTH').to('3,3,NORTH')
        end
      end
    end

    describe '#left', public: true do

      context 'when the robot is off the table' do

        it 'suggests to place it on the table' do
          allow(robot).to receive(:off_the_table?).and_return(true)

          expect(robot.left).to eq 'The robot is off the table. Hint: try to PLACE it.'
        end
      end

      context 'when the robot is facing EAST' do
        it 'rotates the robot to face NORTH' do
          robot.place(table, [3, 2, :east])

          expect{ robot.left }.to change{ robot.report }.from('3,2,EAST').to('3,2,NORTH')
        end
      end

      context 'when the robot is facing SOUTH' do
        it 'rotates the robot to face EAST' do
          robot.place(table, [3, 2, :south])

          expect{ robot.left }.to change{ robot.report }.from('3,2,SOUTH').to('3,2,EAST')
        end
      end

      context 'when the robot is facing WEST' do
        it 'rotates the robot to face SOUTH' do
          robot.place(table, [3, 2, :west])

          expect{ robot.left }.to change{ robot.report }.from('3,2,WEST').to('3,2,SOUTH')
        end
      end

      context 'when the robot is facing NORTH' do
        it 'rotates the robot to face WEST' do
          robot.place(table, [3, 2, :north])

          expect{ robot.left }.to change{ robot.report }.from('3,2,NORTH').to('3,2,WEST')
        end
      end
    end

    describe '#right', public: true do

      context 'when the robot is off the table' do

        it 'suggests to place it on the table' do
          allow(robot).to receive(:off_the_table?).and_return(true)

          expect(robot.right).to eq 'The robot is off the table. Hint: try to PLACE it.'
        end
      end

      context 'when the robot is facing EAST' do
        it 'rotates the robot to face SOUTH' do
          robot.place(table, [3, 2, :east])

          expect{ robot.right }.to change{ robot.report }.from('3,2,EAST').to('3,2,SOUTH')
        end
      end

      context 'when the robot is facing SOUTH' do
        it 'rotates the robot to face WEST' do
          robot.place(table, [3, 2, :south])

          expect{ robot.right }.to change{ robot.report }.from('3,2,SOUTH').to('3,2,WEST')
        end
      end

      context 'when the robot is facing WEST' do
        it 'rotates the robot to face NORTH' do
          robot.place(table, [3, 2, :west])

          expect{ robot.right }.to change{ robot.report }.from('3,2,WEST').to('3,2,NORTH')
        end
      end

      context 'when the robot is facing NORTH' do
        it 'rotates the robot to face EAST' do
          robot.place(table, [3, 2, :north])

          expect{ robot.right }.to change{ robot.report }.from('3,2,NORTH').to('3,2,EAST')
        end
      end
    end
  end
end
