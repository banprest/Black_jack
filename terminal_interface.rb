class TerminalInterface
  attr_reader :game

  def initialize(game)
    @game = game
    new_game
  end

  def new_game
    loop do
      @game.start_game
      see_cards_player
      puts 'Если вы хотите взять карту введите 1
      Если вы хотите вскрыть карты введите 2
      Если вы хотие пропустить ход введите 3'
      choise = gets.chomp
      case choise
      when '1'
        @game.player_add_cards
        game_status
      when '2'
        end_game
      when '3'
        @game.dealer_turn
        two_round
      else
        end_game
      end
      puts 'Чтобы закончить игру введите yes'
      breaK_say = gets.chomp
      break if breaK_say == 'yes'
    end
  end

  def see_cards_player
    puts "Карты игрока #{@game.player.hand.see_card} и сумма этих карт #{@game.player.sum_point}. 
    Ваш банк #{@game.player.bank}"
  end

  def see_cards_dealer
    puts "Карты дилера #{@game.dealer.hand.see_card} и сумма этих карт #{@game.dealer.sum_point}. 
    Банк дилера #{@game.dealer.bank}"
  end

  def game_status
    if @game.status == :player_end
      end_game
    elsif @game.status == :dealer_turn
      see_cards_player
      @game.dealer_turn
      two_round
    end
  end

  def two_round
    puts 'Если вы хотите вскрыть карты введите 1.
    Если вы хотите взять карту(максимум 3) введите 2'
    choise = gets.chomp
    case choise
    when '1'
    end_game
    when '2'
    @game.player.hand.add_card(1, game.deck) if @game.player.hand.see_value[2] == nil
    end_game
    else
    end_game
    end
  end

  def end_game
    see_cards_player
    see_cards_dealer
    @game.end_game
  end
end