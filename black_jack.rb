require_relative 'black_jack_man'
require_relative 'cards'
require_relative 'deck'
require_relative 'hand'
require_relative 'dealer'
require_relative 'player'
require_relative 'game'
require_relative 'terminal_interface'


class BlackJack

  def initialize
    game = Game.new
    TerminalInterface.new(game)
  end
end