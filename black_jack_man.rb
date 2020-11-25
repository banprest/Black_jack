class BlackJackMan
  attr_accessor :bank
  attr_reader :hand 

  def initialize
    @bank = 100
  end

  def hands(hand)
    @hand = hand
  end

  def sum_point
    @hand.point_in_hand.sum
  end
end