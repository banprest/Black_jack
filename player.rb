class Player < BlackJackMan
  attr_reader :name

  def initialize(name)
    @name = name
    @bank = 100
  end
end