require 'spec_helper'

module XOX
  describe ComputerPlayer do
    let (:player) { ComputerPlayer.new('O') }

    it 'chooses an empty square at random' do
      board = player.play(Board.empty)
      played_squares = Board::Positions.map { |p| board[p] }.reject(&:empty?)
      expect(played_squares.count).to eq 1
    end

  end
end
