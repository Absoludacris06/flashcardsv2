Deck.create(subject: "Numbers")

(1..10).each do |i|
  Card.create(definition: i.in_words, answer: i.to_s, deck_id: 1)
end

Deck.create(subject: "Names")

Card.create(definition: "Swigart", answer: "Steven", deck_id: 2)
Card.create(definition: "Saldivar", answer: "Nick", deck_id: 2)
Card.create(definition: "Tsai", answer: "Elaine", deck_id: 2)
Card.create(definition: "Flores", answer: "Alex", deck_id: 2)
