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
    @hand.see_point
  end
end