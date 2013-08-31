class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  has_many :guesses
  has_many :cards, :through => :guesses, dependent: :destroy

  def self.definition(id)
    definition = []
    self.find(id).guesses.each do |guess_obj|
      definition << guess_obj.card.definition
    end
    definition
  end

  def self.answer(id)
    answer = []
    self.find(id).guesses.each do |guess_obj|
      answer << guess_obj.card.answer
    end
    answer
  end

  def self.response(id)
    responses = []
    self.find(id).guesses.each do |guess_obj|
      guess_obj.correctness == 0
      responses << guess_obj.responses
    end
    response
  end

  def self.scores
    Round.definition().zip(Round.answer, Round.response)
  end

end
