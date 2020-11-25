class Hand
attr_reader :cards_in_hand, :point_in_hand, :value_in_hand
  def initialize
    @cards_in_hand = []
    @point_in_hand = []
    @value_in_hand = []
  end

  def point_and_values
    @point_in_hand.clear
    @value_in_hand.clear
    @cards_in_hand.each do |cards|
      @point_in_hand << cards.point
      @value_in_hand << cards.values
    end
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
    point_and_values
    check_on_the_ace
  end

  def check_on_the_ace
    if @point_in_hand.sum > 21 && @value_in_hand[2] == 'T'
      @point_in_hand[2] = 1
    end
  end

  def clear_hand
    @cards_in_hand.clear
    @point_in_hand.clear
    @value_in_hand.clear
  end
end