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

      it 'returns nil' do
        expect(robot.report).to be_nil
      end

      context 'when the robot is on the table' do

        it 'returns the robot current situation' do
          allow(robot).to receive(:situation).and_return([0, 1, :north])
          allow(robot).to receive(:off_the_table?).and_return(false)

          expect(robot.report).to eq [0, 1, :north]
        end
      end
    end

    describe '#place', public: true do

      it 'situates the robot on the table' do
        expect{ robot.place(table, [3, 5, :west]) }.to change{ robot.report }.from(nil).to([3, 5, :west])
      end

      context 'when the robot is on the table' do

        it 'updates the robot current situation' do
          robot.place(table, [0, 1, :north]) # that's ok because the case has been tested just above!

          expect{ robot.place(table, [3, 5, :west]) }.to change{ robot.report }.from([0, 1, :north]).to([3, 5, :west])
        end
      end

      context 'when the requested position is off the table', focus: true do

        it 'does nothing' do
          robot.place(table, [0, 1, :north]) # that's ok because the case has been tested just above!
          allow(table).to receive(:beyond_boundaries?).with([3, 5]).and_return(true)

          expect{ robot.place(table, [3, 5, :west]) }.not_to change{ robot.report }
        end
      end
    end

    describe '#move', public: true do

      context 'when the robot is off the table' do

        it 'returns nil' do
          allow(robot).to receive(:off_the_table?).and_return(true)

          expect(robot.move(table)).to be_nil
        end
      end

      context 'when the robot is facing EAST' do
        it 'moves the robot 1 unit toward EAST (first corrdinate increase)' do
          robot.place(table, [3, 2, :east])

          expect{ robot.move(table) }.to change{ robot.report }.from([3, 2, :east]).to([4, 2, :east])
        end
      end

      context 'when the robot is facing SOUTH' do
        it 'moves the robot 1 unit toward SOUTH (second coordinate descrease)' do
          robot.place(table, [3, 2, :south])

          expect{ robot.move(table) }.to change{ robot.report }.from([3, 2, :south]).to([3, 1, :south])
        end
      end

      context 'when the robot is facing WEST' do
        it 'moves the robot 1 unit toward WEST (first coordinate decrease)' do
          robot.place(table, [3, 2, :west])

          expect{ robot.move(table) }.to change{ robot.report }.from([3, 2, :west]).to([2, 2, :west])
        end
      end

      context 'when the robot is facing NORTH' do
        it 'moves the robot 1 unit toward NORTH (second coordinate increase)' do
          robot.place(table, [3, 2, :north])

          expect{ robot.move(table) }.to change{ robot.report }.from([3, 2, :north]).to([3, 3, :north])
        end
      end
    end

    describe '#left', public: true do

      context 'when the robot is off the table' do

        it 'returns nil' do
          allow(robot).to receive(:off_the_table?).and_return(true)

          expect(robot.left).to be_nil
        end
      end

      context 'when the robot is facing EAST' do
        it 'rotates the robot to face NORTH and returns its new situation' do
          robot.place(table, [3, 2, :east])

          expect{ robot.left }.to change{ robot.report }.from([3, 2, :east]).to([3, 2, :north])
        end
      end

      context 'when the robot is facing SOUTH' do
        it 'rotates the robot to face EAST and returns its new situation' do
          robot.place(table, [3, 2, :south])

          expect{ robot.left }.to change{ robot.report }.from([3, 2, :south]).to([3, 2, :east])
        end
      end

      context 'when the robot is facing WEST' do
        it 'rotates the robot to face SOUTH and returns its new situation' do
          robot.place(table, [3, 2, :west])

          expect{ robot.left }.to change{ robot.report }.from([3, 2, :west]).to([3, 2, :south])
        end
      end

      context 'when the robot is facing NORTH' do
        it 'rotates the robot to face WEST and returns its new situation' do
          robot.place(table, [3, 2, :north])

          expect{ robot.left }.to change{ robot.report }.from([3, 2, :north]).to([3, 2, :west])
        end
      end
    end

    describe '#right', public: true do

      context 'when the robot is off the table' do

        it 'returns nil' do
          allow(robot).to receive(:off_the_table?).and_return(true)

          expect(robot.right).to be_nil
        end
      end

      context 'when the robot is facing EAST' do
        it 'rotates the robot to face SOUTH and returns its new situation' do
          robot.place(table, [3, 2, :east])

          expect{ robot.right }.to change{ robot.report }.from([3, 2, :east]).to([3, 2, :south])
        end
      end

      context 'when the robot is facing SOUTH' do
        it 'rotates the robot to face WEST and returns its new situation' do
          robot.place(table, [3, 2, :south])

          expect{ robot.right }.to change{ robot.report }.from([3, 2, :south]).to([3, 2, :west])
        end
      end

      context 'when the robot is facing WEST' do
        it 'rotates the robot to face NORTH and returns its new situation' do
          robot.place(table, [3, 2, :west])

          expect{ robot.right }.to change{ robot.report }.from([3, 2, :west]).to([3, 2, :north])
        end
      end

      context 'when the robot is facing NORTH' do
        it 'rotates the robot to face EAST and returns its new situation' do
          robot.place(table, [3, 2, :north])

          expect{ robot.right }.to change{ robot.report }.from([3, 2, :north]).to([3, 2, :east])
        end
      end
    end
  end
end
