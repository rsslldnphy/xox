module XOX
  class ComputerPlayer
    def initialize(counter)
      @counter = counter
    end

    def play(board)
      move = Board::Positions.select { |p| board[p].empty? }.shuffle.first
      board.play(counter, move)
    end

    attr_reader :counter
  end
end
