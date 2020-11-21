class Player
  attr_accessor :player_bank
  attr_reader :name, :player_hand, :player_value, :player_card, :card

  def initialize(name)
    @name = name
    @player_bank = 100
    @player_value = []
    @player_card = []
  end

  def player_hands(card)
    @card = card
    @player_hand = card.deck[0..1]
    card.delete_two_cards
    @player_hand.each do |key|
      @player_value << key[1]
      @player_card << key [0]
    end
  end

  def player_add_value_and_card
    @player_hand.each do |key|
      @player_value << key[1]
      @player_card << key [0]
    end
  end

  def player_add_card
    @player_hand << card.deck[0]
    player_clear_value_and_card
    player_add_value_and_card
    if @player_value.sum > 21 && @player_card[2] == 'T+' || @player_card[2] == 'T<3' || @player_card[2] =='T^' || @player_card[2] == 'T<>'
      @player_value[2] = 1
    end
  end

  def player_clear_value_and_card
    @player_value.clear
    @player_card.clear
  end

  def player_clear_all
    @player_hand.clear
    @player_value.clear
    @player_card.clear
  end
end