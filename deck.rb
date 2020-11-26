class Deck
attr_accessor :deck_in_game, :all_cards

  def initialize
    @deck_in_game = []
    refresh_deck
  end

  def refresh_deck
    @deck_in_game.clear
    Card::SUITS.each do |suits|
      Card::VALUES.each do |values|
        @deck_in_game << Card.new(suits, values) 
      end
    end
    @deck_in_game.shuffle!
  end
end