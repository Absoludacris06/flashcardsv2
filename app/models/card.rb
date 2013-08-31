class Card < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :deck
  has_many :rounds, :through => :guesses
  has_many :guesses
end
