class Card < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :deck
  has_many :rounds, :through => :guesses
  has_many :guesses

def self.is_correct?(card_id, guess)

    if Card.find(card_id).answer.downcase == guess.downcase #turn into model method
      @correct = 1
    else
      @correct = 0
    end
  
end



end
