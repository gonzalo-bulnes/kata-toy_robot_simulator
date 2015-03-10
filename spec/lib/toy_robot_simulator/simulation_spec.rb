require 'spec_helper'

module ToyRobotSimulator
  describe Simulation do

    let(:output)     { double('output')       }
    let(:simulation) { Simulation.new(output) }

    it 'can be started', public: true do
      expect(simulation).to respond_to :start
    end

    it 'takes place on a table', public: true do
      expect(simulation.table).to be_kind_of Table
    end

    context 'when started' do

      it 'sends a welcome message', public: true do
        expect(output).to receive(:puts).with('Welcome to Toy Robot Simulator!')
        simulation.start()
      end
    end
  end
end
