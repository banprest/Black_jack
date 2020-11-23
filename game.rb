class Game
  attr_accessor :player, :dealer, :card, :deck, :player_card, :dealer_card

  def initialize
    puts 'Введите имя'
    name = gets.chomp
    @player = Player.new(name)
    @dealer = Dealer.new
    cards
    player_cards
    dealer_cards
  end

  def cards
    @card = Cards.new
    @deck = Deck.new
    @deck.new_deck(card)
    @deck.refresh_deck
  end

  def player_cards
    @player_card = Hand.new(deck)
    @player.hands(player_card)
  end

  def dealer_cards
    @dealer_card = Hand.new(deck)
    @dealer.hands(dealer_card)
  end

  def new_hand
    @deck.refresh_deck
    @player_card.play_hand
    @dealer_card.play_hand
  end

  def start_game
    new_hand
    start_turn_bank
    see_cards_player
  end

  def start_turn_bank
    @player.bank -= 10
    @dealer.bank -= 10
  end

  def see_cards_player
    puts "Карты игрока #{@player.hand.suits} и сумма этих карт #{@player.hand.values_sum}. 
    Ваш банк #{@player.bank}"
  end

  def see_cards_dealer
    puts "Карты дилера #{@dealer.hand.suits} и сумма этих карт #{@dealer.hand.values_sum}. 
    Банк дилера #{@dealer.bank}"
  end

  def player_add_cards
    @player.hand.add_card
    if @player.hand.values_sum >= 21
      end_game
    else
      dealer_turn
    end
  end

  def dealer_turn
    if @dealer.hand.values_sum < 17
      @dealer.hand.add_card
      puts 'Карты дилера ***'
      end_dealer_turn
    else 
      end_dealer_turn
    end 
  end

  def end_dealer_turn
    puts 'Если вы хотите вскрыть карты введите 1.
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
    see_cards_dealer
    see_cards_player
    end_turn_bank
    clear_hand
  end

  def clear_hand
    @player.hand.clear_all
    @dealer.hand.clear_all
  end

  def end_turn_bank
    if @player.hand.values_sum > 21
      @dealer.bank += 20
    elsif @player.hand.values_sum == 21
      @player.bank += 20
    elsif @dealer.hand.values_sum > 21 
      @player.bank += 20
    elsif @dealer.hand.values_sum == 21
      @dealer.bank += 20
    elsif @player.hand.values_sum == @dealer.hand.values_sum
      @player.bank += 10
      @dealer.bank += 10
    elsif @player.hand.values_sum < @dealer.hand.values_sum && @dealer.hand.values_sum <= 21
      @dealer.bank += 20
    elsif @dealer.hand.values_sum < @player.hand.values_sum && @player.hand.values_sum <= 21
      @player.bank += 20
    end 
  end
end