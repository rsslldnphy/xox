module XOX
  class HumanPlayer
    def initialize(counter, cli)
      @counter = counter
      @cli     = cli
    end

    def play(board)
      cli.puts board
      move = cli.ask "Where do you want to move?" do |answer|
        XOX::Board::Positions.include?(answer)
      end
      board.play(counter, move)
    rescue ArgumentError => e
      cli.puts e.message
      play(board)
    end

    attr_reader :counter

    private

    attr_reader :cli
  end
end
