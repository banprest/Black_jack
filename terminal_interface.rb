class TerminalInterface

  def initialize(game)
    @game = game
    new_game
  end

  def new_game
    loop do
      @game.start_game
      puts 'Если вы хотите взять карту введите 1
      Если вы хотите вскрыть карты введите 2
      Если вы хотие пропустить ход введите 3'
      choise = gets.chomp
      case choise
      when '1'
        @game.player_add_cards
      when '2'
        @game.end_game
      when '3'
        @game.dealer_turn
      else
        @game.dealer_turn
      end
      puts 'Чтобы закончить игру введите yes'
      breaK_say = gets.chomp
      break if breaK_say == 'yes'
    end
  end
end