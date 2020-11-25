class Card
  attr_reader :values, :suits, :point
  SUITS = ['<3', '^', '<>', '+'] 
  VALUES = [(2..10).to_a, 'V', 'D', 'K', 'T'].flatten

  def initialize(suits,values)
    @suits = suits
    @values = values
    set_point
  end

  def set_point
    @point = @values if @values.class == Integer
    @point = 10 if @values.class == String
    @point = 11 if @values == 'T' 
  end
end