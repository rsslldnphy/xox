require 'spec_helper'

module XOX
  describe HumanPlayer do
    let (:input)  { stub }
    let (:output) { stub }
    let (:cli)    { XOX::CLI.new(input, output) }
    let (:player) { HumanPlayer.new('O', cli) }

    it 'prints the board and prompts the player for input' do
      board = Board.empty
      output.stubs(:puts)
      output.stubs(:print)
      input.expects(:gets).returns('B1')
      board = player.play(board)
      expect(board.to_s).to eq <<-BOARD
          A   B   C
        -------------
      1 |   | O |   |
        -------------
      2 |   |   |   |
        -------------
      3 |   |   |   |
        -------------
      BOARD
    end

    it 'will not allow the player to play on a full square' do
      board = Board.empty.play('X', 'B1')
      input.expects(:gets).twice.returns('B1', 'C1')
      board = player.play(board)
      expect(board.to_s).to eq <<-BOARD
          A   B   C
        -------------
      1 |   | X | O |
        -------------
      2 |   |   |   |
        -------------
      3 |   |   |   |
        -------------
      BOARD
    end
  end
end
