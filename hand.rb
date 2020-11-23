class Hand
attr_accessor :hand, :suits, :value, :deck
  def initialize(deck)
    @hand = []
    @suits = []
    @value = []
    @deck = deck
  end

  def values_sum
    @value.sum
  end

  def play_hand
    @hand = deck.deck[0..1]
    @deck.rotate
    @deck.rotate
    add_value_and_suits
  end

  def add_value_and_suits
    @hand.each do |key|
      @value << key[1]
      @suits << key [0]
    end
  end

  def add_card
    @hand << deck.deck[0]
    @deck.rotate
    clear_value_and_suits
    add_value_and_suits
    if value.sum > 21 && suits[2] == 'T+' || suits[2] == 'T<3' || suits[2] == 'T^' || suits[2] == 'T<>'
      @value[2] = 1
    end
  end

   def clear_value_and_suits
    @value.clear
    @suits.clear
  end

  def clear_all
    @hand.clear
    @value.clear
    @suits.clear
  end
end