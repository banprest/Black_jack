class Cards
  attr_accessor :hearts, :peaks, :diamonds, :clubs
  attr_reader :SUITS, :VALUES
  SUITS = [('2'..'10').to_a, 'V', 'D', 'K', 'T'] 
  VALUES = [(2..10).to_a, 10, 10, 10, 11]

  def initialize
    @hearts = SUITS.flatten.map { |key| key += '<3' }
    @peaks = SUITS.flatten.map { |key| key += '^' }
    @diamonds = SUITS.flatten.map { |key| key += '<>' }
    @clubs = SUITS.flatten.map { |key| key += '+' }
    suits_and_values
  end

  def suits_and_values
    @hearts = Hash[*hearts.zip(VALUES.flatten).flatten]
    @peaks = Hash[*peaks.zip(VALUES.flatten).flatten]
    @diamonds = Hash[*diamonds.zip(VALUES.flatten).flatten]
    @clubs = Hash[*clubs.zip(VALUES.flatten).flatten]
  end
end