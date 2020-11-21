class Cards
  attr_accessor :deck
  DECK = { 
    'T+' => 11, 'T<3' => 11, 'T^' => 11, 'T<>' => 11, 'K+' => 10, 'K<3' => 10, 'K^' => 10, 'K<>' => 10,
    'D+' => 10, 'D<3' => 10, 'D^' => 10, 'D<>' => 10, 'V+' => 10, 'V<3' => 10, 'V^' => 10, 'V<>' => 10,
    '10+' => 10, '10<3' => 10, '10^' => 10, '10<>' => 10, '9+' => 9, '9<3' => 9, '9^' => 9, '9<>' => 9,
    '8+' => 8, '8<3' => 8, '8^' => 8, '8<>' => 8, '7+' => 7, '7<3' => 7, '7^' => 7, '7<>' => 7,
    '6+' => 6, '6<3' => 6, '6^' => 6, '6<>' => 6, '5+' => 5, '5<3' => 5, '5^' => 5, '5<>' => 5,
    '4+' => 4, '4<3' => 4, '4^' => 4, '4<>' => 4, '3+' => 3, '3<3' => 3, '3^' => 3, '3<>' => 3,
    '2+' => 2, '2<3' => 2, '2^' => 2, '2<>' => 2  
   }

  def initialize
    @deck = DECK.to_a.shuffle
  end

  def delete_two_cards
    @deck.delete_at(0)
    @deck.delete_at(0)
  end

  def delete_one_card
    @deck.delete_at(0)
  end
end