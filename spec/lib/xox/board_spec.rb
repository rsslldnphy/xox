require 'spec_helper'

module XOX
  describe Board do
    let (:board) { Board.empty }

    it 'starts out with all empty squares' do
      Board::Positions.each do |position|
        expect(board[position]).to be_empty
      end
    end

    it 'has a string representation' do
      expect(Board.empty.to_s).to eq <<-BOARD
          A   B   C
        -------------
      1 |   |   |   |
        -------------
      2 |   |   |   |
        -------------
      3 |   |   |   |
        -------------
      BOARD
    end

    it 'can have counters played on it' do
      board = Board.empty.play("X", "B3")
      expect(board.to_s).to eq <<-BOARD
          A   B   C
        -------------
      1 |   |   |   |
        -------------
      2 |   |   |   |
        -------------
      3 |   | X |   |
        -------------
      BOARD
    end

    it 'throws an error if a counter is played on a full square' do
      expect do
        Board.empty.play("X", "B3").play("O", "B3")
      end.to raise_error ArgumentError, "B3 is full"
    end

    it 'knows if the game has been won' do
      board = Board.empty.play("X", "B1").play("X", "B2").play("X", "B3")
      expect(board).to be_won
    end

    it 'knows when the game is yet to be won' do
      board = Board.empty.play("X", "B1")
      expect(board).not_to be_won
    end

    it 'knows who won' do
      board = Board.empty.play("X", "B1").play("X", "B2").play("X", "B3")
      expect(board.winner).to eq 'X'
    end

    it 'knows if it is full' do
      board = Board::Positions.reduce(Board.empty) { |b, p| b.play('X', p) }
      expect(board).to be_full
    end

    it 'knows if it is not yet full' do
      board = Board::Positions.drop(1).reduce(Board.empty) { |b, p| b.play('X', p) }
      expect(board).not_to be_full
    end
  end
end
