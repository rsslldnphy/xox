require 'spec_helper'

describe XOX::CLI do

  let (:input)  { stub }
  let (:output) { stub }

  let (:cli) { XOX::CLI.new(input, output) }

  describe '#ask' do

    it 'asks the given question repeatedly until given a valid answer, which it uppercases' do

      output.expects(:puts, "What is your favourite colour?").twice
      output.expects(:print, "?- ").twice

      input.stubs(:gets).returns("cerise\n", "blue\n")

      colour = cli.ask "What is your favourite colour?" do |answer|
        ['BLUE', 'RED', 'YELLOW'].include? answer
      end

      expect(colour).to eq 'BLUE'
    end

  end

end
