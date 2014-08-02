require './lib/xox'

cli = XOX::CLI.new

cli.puts <<-TITLE

*************************
*** Noughts & Crosses ***
*************************

TITLE

counter = cli.ask "Do you want to play as X or O?" do |answer|
  XOX::Counters.include?(answer)
end

human    = XOX::HumanPlayer.new(counter, cli)
computer = XOX::ComputerPlayer.new(counter == 'O' ? 'X' : 'O')

players =  [human, computer].sort_by(&:counter).reverse

board = players.cycle.inject(XOX::Board.empty) do |board, player|
  break board if board.won? || board.full?
  player.play(board)
end

cli.puts board
cli.puts "GAME OVER"

if board.won?
  cli.puts "The winner was '#{board.winner}'"
else
  cli.puts "Stalemate. The only winning move is not to play."
end
