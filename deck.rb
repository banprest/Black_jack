class Deck
attr_accessor :deck_in_game, :all_cards

  def initialize
    @deck_in_game = []
    @all_cards = []
    Card::SUITS.each do |suits|
      Card::VALUES.each do |values|
        @all_cards << Card.new(suits, values) 
      end
    end
  end

  def refresh_deck
    @deck_in_game.clear
    @deck_in_game += @all_cards
    @deck_in_game.shuffle!
  end
end