class Deck
attr_accessor :deck, :all_cards

  def initialize
    @deck = []
  end

  def new_deck(cards)
    @all_cards = cards
    @deck << all_cards.hearts.to_a
    @deck << all_cards.diamonds.to_a
    @deck << all_cards.peaks.to_a
    @deck << all_cards.clubs.to_a
    @deck.flatten!(1)
  end

  def refresh_deck
    @deck.shuffle!
  end

  def rotate
    @deck.rotate!
  end
end