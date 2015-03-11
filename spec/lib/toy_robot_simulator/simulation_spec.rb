require 'spec_helper'

module ToyRobotSimulator
  describe Simulation do

    let(:output)     { double('output')       }
    let(:simulation) { Simulation.new(output) }

    it 'can be started', public: true do
      expect(simulation).to respond_to :start
    end

    it 'accepts user input', public: true do
      expect(simulation).to respond_to :input
    end

    context 'when started' do

      it 'outputs a welcome message', public: true do
        expect(output).to receive(:puts).with('Welcome to Toy Robot Simulator! (Press Ctrl+D to exit.)')
        simulation.start()
      end
    end

    context 'on user input', public: true do

      it 'gives immediate feedback' do
        command = 'PLACE 0,0,SOUTH'
        allow(output).to receive(:print) # let's ignore other calls to :print
        expect(output).to receive(:print).with command + '...'
        simulation.input command
      end
    end
  end
end
