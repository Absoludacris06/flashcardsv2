Deck.create(subject: "Numbers")

(1..20).each do |i|
  Card.create(definition: i.in_words, answer: i.to_s, deck_id: 1)
end

