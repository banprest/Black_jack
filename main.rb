require_relative 'cards'
require_relative 'diler'
require_relative 'player'

class Main
  attr_reader :player, :diler, :cards

  def initialize
    @player = []
    @diler = []
    @cards = []
  end

  def menu
    create_player

    loop do
      start_game
      puts 'Если вы хотите взять карту введите 1
      Если вы хотите вскрыть карты введите 2
      Если вы хотие пропустить ход введите 3'
      choise = gets.chomp
      case choise
      when '1'
        player_add_cards
      when '2'
        end_game
      when '3'
        diler_turn
      else
        diler_turn
      end
      puts 'Чтобы закончить игру введите yes'
      breaK_say = gets.chomp
      break if breaK_say == 'yes'
    end
  end

  private

  def create_player
    puts 'Введите своё имя'
    name = gets.chomp.to_s
    @player << Player.new(name)
    @diler << Diler.new
  end

  def start_game
    new_hand
    start_turn_bank
    see_cards_player
  end

  def new_hand
    @cards << Cards.new
    @player[0].player_hands(@cards[0])
    @diler[0].diler_hands(@cards[0])  
  end

  def start_turn_bank
    @player[0].player_bank -= 10
    @diler[0].diler_bank -= 10
  end

  def player_add_cards
    @player[0].player_add_card
    @cards[0].delete_one_card
    if @player[0].player_value.sum >= 21
      end_game
    else
      diler_turn
    end
  end

  def diler_turn
    if @diler[0].diler_value.sum < 17
      @diler[0].diler_add_card
      @cards[0].delete_one_card
      puts 'Карты дилера ***'
      end_diler_turn
    else 
      end_diler_turn
    end 
  end

  def end_diler_turn
    puts 'Если вы хотите закончить игру введите 1.
    Если вы хотите взять карту(максимум 3) введите 2'
    choise = gets.chomp
    case choise
    when '1'
      end_game
    when '2'
      player_add_cards if @player[0].player_card[2] == nil
    else
      end_game
    end
  end

  def end_game
    see_cards_diler
    see_cards_player
    end_turn_bank
    clear_hand
    @cards.clear
  end

  def end_turn_bank
    if @player[0].player_value.sum > 21
      @diler[0].diler_bank += 20
    elsif @player[0].player_value.sum == 21
      @player[0].player_bank += 20
    elsif @diler[0].diler_value.sum > 21 
      @player[0].player_bank += 20
    elsif @diler[0].diler_value.sum == 21
      @diler[0].diler_bank += 20
    elsif @player[0].player_value.sum == @diler[0].diler_value.sum
      @player[0].player_bank += 10
      @diler[0].diler_bank += 10
    elsif @player[0].player_value.sum < @diler[0].diler_bank && @diler[0].diler_value.sum <= 21
      @diler[0].diler_bank += 20
    elsif @diler[0].diler_value.sum < @player[0].player_value.sum && @player[0].player_value.sum <= 21
      @player[0].player_bank += 20
    end 
  end

  def see_cards_diler
    puts "Карты дилера #{@diler[0].diler_card} и сумма этих карт #{@diler[0].diler_value.sum}. 
    Банк дилера #{@diler[0].diler_bank}"
  end

  def see_cards_player
    puts "Карты игрока #{@player[0].player_card} и сумма этих карт #{@player[0].player_value.sum}. 
    Ваш банк #{@player[0].player_bank}"
  end

  def clear_hand
    @player[0].player_clear_all
    @diler[0].diler_clear_all
  end
end