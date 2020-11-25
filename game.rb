class Game
  attr_reader :player, :dealer, :card, :deck, :player_card, :dealer_card, :status

  def initialize(name)
    @player = Player.new(name)
    @dealer = Dealer.new
    cards
    player_cards
    dealer_cards
    @status
  end

  def cards
    @deck = Deck.new
  end

  def player_cards
    @player_card = Hand.new
    @player.hands(player_card)
  end

  def dealer_cards
    @dealer_card = Hand.new
    @dealer.hands(dealer_card)
  end

  def new_hand
    @deck.refresh_deck
    @player_card.add_card(2, deck)
    @dealer_card.add_card(2, deck)
  end

  def start_game
    new_hand
    start_turn_bank
  end

  def start_turn_bank
    @player.bank -= 10
    @dealer.bank -= 10
  end

  def player_add_cards
    @player.hand.add_card(1, deck)
    if @player.sum_point >= 21
      @status = :player_end
    else
      @status = :dealer_turn
    end
  end

  def dealer_turn
    if @dealer.sum_point < 17
      @dealer.hand.add_card(1, deck)
    end 
  end

  def end_game
    end_turn_bank
    clear_hand
  end

  def clear_hand
    @player.hand.clear_hand
    @dealer.hand.clear_hand
  end

  def who_winner
    if @player.sum_point > 21
      @winner = 'dealer'
    elsif @player.sum_point == 21
      @winner = 'player'
    elsif @dealer.sum_point > 21 
      @winner = 'player'
    elsif @dealer.sum_point == 21
      @winner = 'dealer'
    elsif @player.sum_point == @dealer.sum_point
      @winner = 'nil'
    elsif @player.sum_point < @dealer.sum_point && @dealer.sum_point <= 21
      @winner = 'dealer'
    elsif @dealer.sum_point < @player.sum_point && @player.sum_point <= 21
      @winner = 'player'
    end
  end

  def end_turn_bank
    who_winner
    if @winner == 'dealer'
      @dealer.bank += 20
    elsif @winner == 'nil'
      @dealer.bank += 10 && @player.bank += 0
    else @winner == 'player'
      @player.bank += 20
    end
  end    
end