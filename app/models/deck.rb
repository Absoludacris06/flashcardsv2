class Deck < ActiveRecord::Base
  has_many :cards, dependent: :destroy

  def self.shuffled_card_ids(deck_id)
    ids = []
    cards = Deck.find(deck_id).cards
    cards.each do |card|
      ids << card.id
    end
    ids.shuffle
  end
end
