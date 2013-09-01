
post ('/round') do
  @round = Round.create(user_id: session[:user_id], deck_id: params[:deck_id])
  session[:round_id] = @round.id
  session[:deck] = Deck.shuffled_card_ids(params[:deck_id])
  @card = Card.find(session[:deck].pop)
  erb :guess
end

post ('/guess') do
  if Card.find(params[:card_id]).answer.downcase == params[:guess].downcase #turn into model method
      @correct = 1
    else
      @correct = 0
    end
  @guess = Guess.create(card_id: params[:card_id], round_id: session[:round_id], correctness: @correct, response: params[:guess])

  if session[:deck].empty?
    redirect '/results'
  else
    @card = Card.find(session[:deck].pop)
    erb :guess
  end
end

get ('/results') do
  @guesses = Round.results(session[:round_id])
  @results = []
  @guesses.each do |guess|
  @results << [Card.find(guess.card_id).definition, Card.find(guess.card_id).answer, guess.response, guess.correctness]
  end
  erb :results
end
