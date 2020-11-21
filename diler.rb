class Diler
  attr_accessor :diler_bank
  attr_reader :diler_value, :diler_card, :diler_hand, :card

  def initialize
    @diler_bank = 100
    @diler_value = []
    @diler_card = []
  end

  def diler_hands(card)
    @card = card
    @diler_hand = card.deck[0..1]
    card.delete_two_cards
    @diler_hand.each do |key|
      @diler_value << key[1]
      @diler_card << key [0]
    end
  end

  def diler_add_value_and_card
    @diler_hand.each do |key|
      @diler_value << key[1]
      @diler_card << key [0]
    end
  end

  def diler_add_card
    @diler_hand << card.deck[0]
    diler_clear_value_and_card
    diler_add_value_and_card
    if diler_value.sum > 21 && @diler_card[2] == 'T+' || @diler_card[2] == 'T<3' || @diler_card[2] == 'T^' || @diler_card[2] == 'T<>'
      @diler_value[2] = 1
    end
  end

  def diler_clear_value_and_card
    @diler_value.clear
    @diler_card.clear
  end

  def diler_clear_all
    @diler_hand.clear
    @diler_value.clear
    @diler_card.clear
  end
end