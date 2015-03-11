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

    it 'involves a robot', public: true do
      expect(simulation).to respond_to :robot
    end

    context 'when started' do

      it 'outputs a welcome message', public: true do
        allow(output).to receive(:puts).with("\nReady to receive commands when you are:\n")
        expect(output).to receive(:puts).with('Welcome to Toy Robot Simulator! (Press Ctrl+D to exit.)')
        simulation.start()
      end

      it 'prompts for commands', public: true do
        allow(output).to receive(:puts).with('Welcome to Toy Robot Simulator! (Press Ctrl+D to exit.)')
        expect(output).to receive(:puts).with("\nReady to receive commands when you are:\n")
        simulation.start()
      end
    end

    context 'on user input', public: true do

      before(:each) do
        allow(output).to receive(:print) # let's ignore the calls to :print that we're not targetting
      end

      it 'gives immediate feedback' do
        command = 'PLACE 0,0,SOUTH'
        expect(output).to receive(:print).with command + '...'
        simulation.input command
      end

      describe 'discards invalid input' do

        ['PLACE 1,2,EAST', 'PLACE 1,2,SOUTH', 'PLACE 0,0,WEST', 'PLACE 0,0,NORTH',
         'PLACE 123,21,EAST', 'PLACE 11,2,SOUTH', 'PLACE 0,043,WEST', 'PLACE 0,10,NORTH',
         'MOVE', 'REPORT',  'LEFT', 'RIGHT'].each do |command|

          it "\'#{command}\' is valid" do
            expect(output).to receive(:print).with " done\n"
            simulation.input command
          end
        end

        ['PLACE! 1,2,EAST', 'PLACE SOUTH,1,2', 'PLACE 0xB,0,WEST',
         'PRINT', 'report',  'ROTATE', 'LEFT RIGHT'].each do |command|

          it "\'#{command}\' is invalid" do
            expect(output).to receive(:print).with " invalid\n"
            simulation.input command
          end
        end
      end

      context 'when command is `REPORT`' do

        it 'outputs the robot location' do
          pending 'Not yet implemented.'
          expect(output).to receive(:puts).with('0,1,NORTH')
          simulation.input('REPORT')
        end
      end
    end
  end
end
