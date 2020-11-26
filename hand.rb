class Hand
attr_reader :cards_in_hand, :point_in_hand, :value_in_hand
  def initialize
    @cards_in_hand = []
    
  end

  def see_value
    @cards_in_hand.map { |card| card.values }
  end

  def see_point
    @cards_in_hand.map { |card| card.point  }.sum
  end

  def see_card
    @cards_in_hand.map { |card| card.values.to_s + card.suits }
  end

  def add_card(num,deck)
    count = 0
    while count < num
      @cards_in_hand << deck.deck_in_game.shift
      count += 1
    end
    check_on_the_ace
  end

  def check_on_the_ace
    if see_point > 21 && see_value[2] == 'T'
      @cards_in_hand[2].point = 1
    end
  end

  def clear_hand
    @cards_in_hand.clear
  end
end