class Card
  attr_accessor :point
  attr_reader :values, :suits
  SUITS = ['<3', '^', '<>', '+'] 
  VALUES = [(2..10).to_a, 'V', 'D', 'K', 'T'].flatten

  def initialize(suits,values)
    @suits = suits
    @values = values
    set_point
  end

  def set_point
    @point =
      if  @values.instance_of?(Integer)
        @values
      elsif @values == 'T'
        11
      elsif @values.instance_of?(String)
        10
      end
  end
end