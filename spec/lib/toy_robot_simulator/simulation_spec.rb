require 'spec_helper'

module ToyRobotSimulator
  describe Simulation do

    let(:output)     { double('output')             }
    let(:simulation) { Simulation.new(output, true) }

    it 'can be started', public: true do
      expect(simulation).to respond_to :start
    end

    it 'accepts user input', public: true do
      expect(simulation).to respond_to :input
    end

    it 'involves a robot', public: true do
      expect(simulation).to respond_to :robot
    end

    it 'involves a table', public: true do
      expect(simulation).to respond_to :table
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

      it 'unless the verbose mode is disabled' do
        simulation = Simulation.new(output, false)

        command = 'PLACE 0,0,SOUTH'
        expect(output).not_to receive(:print)
        simulation.input command
      end

      describe 'reports invalid input' do

        valid_commands = ['PLACE 1,2,EAST', 'PLACE 1,2,SOUTH', 'PLACE 0,0,WEST', 'PLACE 0,0,NORTH',
                          'PLACE 123,21,EAST', 'PLACE 11,2,SOUTH', 'PLACE 0,043,WEST',
                          'PLACE 0,10,NORTH', 'MOVE', 'REPORT',  'LEFT', 'RIGHT']

        invalid_commands = ['PLACE! 1,2,EAST', 'PLACE SOUTH,1,2', 'PLACE 0xB,0,WEST',
                            'PRINT', 'report',  'ROTATE', 'LEFT RIGHT']

        all_commands = valid_commands + invalid_commands

        valid_commands.each do |command|

          it "\'#{command}\' is valid" do
            expect(output).to receive(:print).with " done\n"
            simulation.input command
          end
        end

        invalid_commands.each do |command|

          it "\'#{command}\' is invalid" do
            expect(output).to receive(:print).with " invalid\n"
            simulation.input command
          end
        end

        context 'when the verbose mode is disabled' do

          it 'outputs nothing but the REPORT reponse' do
            simulation = Simulation.new(output, false)

            all_commands.reject{ |command| command == 'REPORT' }.each do |command|
              expect(output).not_to receive(:print)
              simulation.input command
            end
          end
        end
      end

      context 'when command is `REPORT`' do

        context 'when the robot is on the table' do

          it 'outputs the robot situation' do
            simulation.input('PLACE 0,1,NORTH')

            expect(output).to receive(:print).with("0,1,NORTH\n")
            simulation.input('REPORT')
          end
        end
      end

      context 'when command is `PLACE`' do

        it 'updates the robot situation and outputs feedback' do
          expect(output).to receive(:print).with "2,1,EAST\n"
          simulation.input('PLACE 2,1,EAST')
        end

        context 'when the verbose mode is disabled' do

          let(:simulation) { Simulation.new(output, false) }

          it 'updates the robot situation quietly' do
            expect(output).not_to receive(:print)
            simulation.input('PLACE 2,1,EAST')
          end
        end

        context 'when the command would result in letting the robot off the table' do

          # The Simulation instances depend on a Table instance. Creating the table
          # (and the robot) is arguably part of the ToyRobotSimulator reponsibilities,
          # and the separation of concerns principle would suggest to inject
          # those dependencies into Simulation instances.
          #
          # That would also make easier to test behaviour that depends on
          # table characteristics because one could inject distinct tables
          # depending on the need.
          #
          # However, I find it's not worth doing that refactoring because using
          # distinct tables is beyond scope. On the testing side, luckily, the milagrous
          # `allow_any_instance_of` method exists which allows to ignore encapsulation
          # boundraries.
          # See http://www.relishapp.com/rspec/rspec-mocks/v/3-2/docs/working-with-legacy-code/any-instance

          it 'does nothing but outputs feedback', focus: true do
            simulation.input('PLACE 2,1,EAST')

            expect(output).to receive(:print).with "2,1,EAST\n"
            simulation.input('PLACE 6,3,EAST')
          end

          context 'when the verbose mode is disabled' do

            let(:simulation) { Simulation.new(output, false) }

            it 'does (quietly) nothing', focus: true do
              simulation.input('PLACE 2,1,EAST')

              expect(output).not_to receive(:print)
              simulation.input('PLACE 6,3,EAST')
            end
          end
        end
      end

      context 'when command is `MOVE`' do

        it 'updates the robot situation and outputs feedback' do
          simulation.input('PLACE 2,1,EAST')

          expect(output).to receive(:print).with "3,1,EAST\n"
          simulation.input('MOVE')
        end

        context 'when the verbose mode is disabled' do

          let(:simulation) { Simulation.new(output, false) }

          it 'updates the robot situation quietly' do
            simulation.input('PLACE 2,1,EAST')

          expect(output).not_to receive(:print)
          simulation.input('MOVE')
          end
        end

        context 'when the command would result in letting the robot fall off the table' do

          it 'does nothing but gives feedback' do
            simulation.input('PLACE 5,3,EAST')

            expect(output).to receive(:print).with "5,3,EAST\n"
            simulation.input('MOVE')
          end

          context 'when the verbose mode is disabled' do

            let(:simulation) { Simulation.new(output, false) }

            it 'does (quietly) nothing' do
              simulation.input('PLACE 5,3,EAST')

              expect(output).not_to receive(:print)
              simulation.input('MOVE')
            end
          end
        end
      end

      context 'when command is `LEFT`' do

        it 'updates the robot orientation and outputs feedback' do
          simulation.input('PLACE 2,1,EAST')

          expect(output).to receive(:print).with "2,1,NORTH\n"
          simulation.input('LEFT')
        end

        context 'when the verbose mode is disabled' do

          let(:simulation) { Simulation.new(output, false) }

          it 'updates the robot situation quietly' do
            simulation.input('PLACE 2,1,EAST')

            expect(output).not_to receive(:print)
            simulation.input('LEFT')
          end
        end
      end

      context 'when command is `RIGHT`' do

        it 'updates the robot orientation quietly' do
          simulation.input('PLACE 2,1,EAST')

          expect(output).to receive(:print).with "2,1,SOUTH\n"
          simulation.input('RIGHT')
        end

        context 'when the verbose mode is disabled' do

          let(:simulation) { Simulation.new(output, false) }

          it 'updates the robot situation quietly' do
            simulation.input('PLACE 2,1,EAST')

            expect(output).not_to receive(:print)
            simulation.input('RIGHT')
          end
        end
      end
    end
  end
end
