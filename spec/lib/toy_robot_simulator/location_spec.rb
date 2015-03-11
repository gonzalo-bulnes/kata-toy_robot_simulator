require 'spec_helper'
require 'toy_robot_simulator/location'

module ToyRobotSimulator
  describe Location, protected: true do

    describe '.initialize' do

      it 'requires a kind of Table as first argument' do
        expect{ ToyRobotSimulator::Location.new(:anything_but_a_kind_of_table, 0, 0) }.to \
          raise_error ArgumentError, 'first argument must be a kind of ToyRobotSimulator::Table'
      end

      it 'requires a kind of Fixnum as second and third arguments' do
        expect{ ToyRobotSimulator::Location.new(Table.new, :anything_but_a_kind_of_fixnum, 0) }.to \
          raise_error ArgumentError, 'second argument must be a kind of Fixnum'

        expect{ ToyRobotSimulator::Location.new(Table.new, 0, :anything_but_a_kind_of_fixnum) }.to \
          raise_error ArgumentError, 'third argument must be a kind of Fixnum'
      end
    end
  end
end
