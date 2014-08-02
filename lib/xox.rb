$:.unshift File.dirname(__FILE__)

module XOX
  Counters  = ['X', 'O']
end

require 'forwardable'
require 'xox/square'
require 'xox/board'
require 'xox/cli'
require 'xox/computer_player'
require 'xox/human_player'
